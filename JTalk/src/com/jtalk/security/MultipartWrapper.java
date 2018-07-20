package com.jtalk.security;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
@SuppressWarnings("unchecked")
public class MultipartWrapper {

	
	protected Map<Object,Object> parameters = Collections.synchronizedMap( new HashMap() );

	protected Map<Object,Object> files = Collections.synchronizedMap( new HashMap() );
	
	public MultipartWrapper(HttpServletRequest request,String saveDirectory, int maxPostSize, String encoding,FileRenamePolicy policy) throws Exception {
        // Sanity check values
        if (request == null)
            throw new IllegalArgumentException("request cannot be null");
        if (saveDirectory == null)
            throw new IllegalArgumentException("saveDirectory cannot be null");
 
        // Save the dir
        File dir = new File(saveDirectory);
 
        // 디렉토리 인지 체크
        if (!dir.isDirectory())
            throw new IllegalArgumentException("Not a directory: "+ saveDirectory);
 
        // write 할수 있는 디렉토리인지 체크
        if (!dir.canWrite())
            throw new IllegalArgumentException("Not writable: " + saveDirectory);
 
        MultipartParser parser = null;
        
        try {
        
        	parser = new MultipartParser(request, maxPostSize, true, true, encoding);
        	
        }catch(IOException e) {

        	e.printStackTrace();
        }
        
        
 
        if (request.getQueryString() != null) {
            // HttpUtil이 Deprecated 되었기 때문에 다른방식으로 작성                      
        	Map<String, String[]> queryParameters = Collections.synchronizedMap( request.getParameterMap() );
            Iterator queryParameterNames = queryParameters.keySet().iterator();
            while( queryParameterNames.hasNext() ) {
                Object paramName = queryParameterNames.next();
                String[] values = ( String[] ) queryParameters.get( paramName );
                List<Object> newValues = Collections.synchronizedList( new ArrayList<Object>() );
                for( String value : values ) {
                    newValues.add( value );
                }
                parameters.put(paramName, newValues ); 
            }
        }
 
        Part part;
        while ((part = parser.readNextPart()) != null) {
            String name = part.getName();
            if (name == null) {
                throw new IOException("Malformed input: parameter name missing (known Opera 7 bug)");
            }
            if (part.isParam()) {
                // It's a parameter part, add it to the vector of values
                ParamPart paramPart = (ParamPart) part;
                String value = paramPart.getStringValue();
                List<Object> existingValues = (List<Object>) parameters.get(name);
                if (existingValues == null) {
                    existingValues = new Vector();
                    parameters.put(name, existingValues);
                }
                existingValues.add( value );
            } else if ( part.isFile() ) {
                // It's a file part
                FilePart filePart = (FilePart) part;
                String fileName = filePart.getFileName();
                if (fileName != null) {
                    //file 확장자를 validation 합니다.
                    //만약 유효하지 않은 확장자라면 InvalidFileExtensionException을 throw 합니다.
                	String[] extensions = {"jpg", "jpeg", "gif", "png", "hwp", "pdf", "ppt", "pptx", "xlsx", "doc"};
                    if(isValidFileExtension(fileName, extensions)) {
                        throw new IOException( "Invalid File Extension" );
                    } else {
                        filePart.setRenamePolicy(policy); // null policy is OK
                        filePart.writeTo(dir);
                        files.put(name,
                                new UploadedFile(dir.toString(), filePart
                                        .getFileName(), fileName, filePart
                                        .getContentType()));   
                    }
                     
                } else {
                    // The field did not contain a file
                    files.put(name, new UploadedFile(null, null, null, null));
                }
            }
        }
    }
	
	public Iterator<Object> getParameterNames() {
        return parameters.keySet().iterator();
    }
 
    public Iterator<Object> getFileNames() {
        return files.keySet().iterator();
    }
 
    public String getParameter(String name) {
        try {
            List<Object> values = (List<Object>) parameters.get(name);
            if (values == null || values.size() == 0) {
                return null;
            }
            String value = (String) values.get(values.size() - 1);
            
            if("content".equalsIgnoreCase(name)) {
            	
            	return summernoteCleanXSS(value);
            	
            }
            
            return cleanXSS(value);
        } catch (Exception e) {
            return null;
        }
    }
 
    public Object[] getParameterValues(String name) {
        try {
            List<Object> values = (List<Object>) parameters.get(name);
            if (values == null || values.size() == 0) {
                return null;
            }
            return values.toArray();
        } catch (Exception e) {
            return null;
        }
    }
 
    public String getFilesystemName(String name) {
        try {
            UploadedFile file = (UploadedFile) files.get(name);
            return file.getFilesystemName(); // may be null
        } catch (Exception e) {
            return null;
        }
    }
 
    public String getOriginalFileName(String name) {
        try {
            UploadedFile file = (UploadedFile) files.get(name);
            return file.getOriginalFileName(); // may be null
        } catch (Exception e) {
            return null;
        }
    }
 
    public String getContentType(String name) {
        try {
            UploadedFile file = (UploadedFile) files.get(name);
            return file.getContentType(); // may be null
        } catch (Exception e) {
            return null;
        }
    }
 
    public File getFile(String name) {
        try {
            UploadedFile file = (UploadedFile) files.get(name);
            return file.getFile(); // may be null
        } catch (Exception e) {
            return null;
        }
    }
     
    public boolean isValidFileExtension( String fileName ,String[] extensions) throws Exception{
        boolean result = false;
        if( fileName != null && !"".equals( fileName ) && !isContainFileExtension(fileName, extensions)) {
            result = true;
        }
        else {
            result = false;
        }
        return result;
    }
    private boolean isContainFileExtension( String fileName, String[] extensions ) throws Exception{
        boolean result = false;
        String fileExtension = getFileExtension( fileName );
        for( String ex : extensions ) {
            if(fileExtension.equalsIgnoreCase(ex)) {
                result = true;
                break;
            }
        }
        return result;
    }
    private String getFileExtension( String fileName ) throws Exception{
        String fileExtension = "";
        if( fileName != null && !"".equals( fileName )) {
            if( fileName.lastIndexOf( "." ) != -1){
                fileExtension = fileName.toLowerCase().substring( fileName.lastIndexOf( "." ) + 1, fileName.length() );
            }
            else {
                fileExtension = "";
            }
        }else{
            fileExtension = "";
        }
        return fileExtension;
    }
       
	private String cleanXSS(String value) {      

		  value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");         
		  
		  value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");         
		  
		  value = value.replaceAll("'", "& #39;");        
		  
		  value = value.replaceAll("eval\\((.*)\\)", "");         
		  
		  value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");         
		  
		  value = value.replaceAll("script", "");         
		  
		  return value;     
		  
	} 
	
	private String summernoteCleanXSS(String value) {      

		  value = value.replaceAll("<s", "& lt;").replaceAll("t>", "& gt;");
		  
		  value = value.replaceAll("<S", "& lt;").replaceAll("T>", "& gt;");
		  
		  value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");         
		  
		  value = value.replaceAll("'", "& #39;");        
		  
		  value = value.replaceAll("eval\\((.*)\\)", "");         
		  
		  value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");         
		  
		  value = value.replaceAll("script", "");         
		  
		  return value;     
		  
	}

}
