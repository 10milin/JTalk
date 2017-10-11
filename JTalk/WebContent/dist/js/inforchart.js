$(function () {
var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
var pieChart       = new Chart(pieChartCanvas)
var PieData        = [
  {
    value    : $('#ItSize').text(),
    color    : '#f56954',
    highlight: '#f56954',
    label    : 'IT'
  },
  {
    value    : $('#JapaneseSize').text(),
    color    : '#00a65a',
    highlight: '#00a65a',
    label    : '일본어'
  },
  {
    value    : $('#FoodSize').text(),
    color    : '#f39c12',
    highlight: '#f39c12',
    label    : '주변맛집'
  },
  {
    value    : $('#LifeSize').text(),
    color    : '#00c0ef',
    highlight: '#00c0ef',
    label    : '생활정보'
  }
]
var pieOptions     = {
  segmentShowStroke    : true,
  segmentStrokeColor   : '#fff',
  segmentStrokeWidth   : 2,
  percentageInnerCutout: 50,
  animationSteps       : 100,
  animationEasing      : 'easeOutBounce',
  animateRotate        : true,
  animateScale         : false,
  responsive           : true,
  maintainAspectRatio  : true
}
pieChart.Doughnut(PieData, pieOptions);
});