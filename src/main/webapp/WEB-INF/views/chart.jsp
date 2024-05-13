<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js" type="module"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js" type="module"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<div>
  <canvas id="line-chart" class="plot" width="1800" height="500"></canvas>
</div>

</body>
</html>


<script>


$(document).ready(function(){
	//getGraph();
	getSumGraph();
});


 
   function getSumGraph(){
	let sumList = [];
	

	$.ajax({
		url:"/chart",
		type : "get",
		dataType : "json",
		success : function(data){
			 for(let i=0; i<data.length; i++){
	                const datetime = data[i].time; // 날짜와 시간 값 가져오기
	                const date = datetime.split(' ')[0]; // 날짜 부분만 추출하기
				  sumList.push({ time: data[i].time, ping: data[i].ping});
			}
			console.log(sumList); 

		

			new Chart(document.getElementById("line-chart").getContext('2d'), {
				  type: 'line',
				  data: {
				    labels: sumList.map(item => item.time),
				  //labels:Array.from(new Set(sumList.map(item => item.date))),
				    datasets: [{ 
				        data: sumList.map(item => item.ping),
				        borderColor: "#3e95cd",
				        fill: false,
				        pointRadius : 1
				      }
				    ]
				  },
				  options: {
			            legend: {
			                display: false
			            },
					  responsive : true,
						scales: {
								 x: {
			                            type: 'time',
			                            labels: sumList.map(item => item.label),
			                            time: {
			                              unit: 'day'
			                            }
			                        }, 
							},						
						}
				});
		}
	})
}   
      
  
 
 
 /*    function getSumGraph(){
	    let sumList = [];

	    $.ajax({
	        url: "/chart",
	        type: "get",
	        dataType: "json",
	        success: function(data){
	            for(let i = 0; i < data.length; i++){
	                const datetime = data[i].time; // 날짜와 시간 값 가져오기
	                const date = datetime.split(' ')[0]; // 날짜 부분만 추출하기
	                sumList.push({ date: date, ping: data[i].ping }); // 날짜를 date로 변경하여 sumList에 추가
	            }
	            console.log(sumList); 

	            new Chart(document.getElementById("line-chart"), {
	                type: 'line',
	                data: {
	                    labels: Array.from(new Set(sumList.map(item => item.date))), // 중복되지 않는 날짜 배열 추출하여 x축 라벨로 설정
	                    datasets: [{ 
	                        data: sumList.map(item => item.ping), // ping 데이터 사용
	                        borderColor: "#3e95cd",
	                        fill: false
	                    }]
	                },
	                options: {
	                    responsive: false,
	                    scales: {
	                        x: {
	                            type: 'time',
	                            time: {
	                              unit: 'millisecond',
	                              //distribution: 'series'
	                            }
	                        },

	                    }
	                }
	            });
	        }
	    });
	}    */
	
/* 	function getSumGraph() {
	    let sumList = [];

	    $.ajax({
	        url: "/chart",
	        type: "get",
	        dataType: "json",
	        success: function(data) {
	            // 데이터 변환: 날짜 및 시간에서 월-일, 시간 추출하여 새로운 객체로 변환
	            sumList = data.map(item => ({
	                label: item.time.substring(5, 10), // 월-일 추출
	                time: item.time.substring(11, 19), // 시간 추출
	                ping: item.ping
	            }));
	            console.log(sumList);

	            // 각 날짜별로 시간별 ping 값을 그룹화하여 시간대 순서대로 정렬
	            const groupedData = sumList.reduce((acc, cur) => {
	                if (!acc[cur.label]) {
	                    acc[cur.label] = [];
	                }
	                acc[cur.label].push(cur);
	                return acc;
	            }, {});

	            // 시간대 순서대로 정렬된 데이터를 가진 배열 생성
	            const sortedData = Object.values(groupedData).map(group => group.sort((a, b) => a.time.localeCompare(b.time)));

	            // 첫 번째 날짜의 시간을 라벨로 사용
	            const labels = sortedData[0].map(item => item.time);

	            // Chart.js 그래프 생성
	            new Chart(document.getElementById("line-chart").getContext('2d'), {
	                type: 'line',
	                data: {
	                    labels: labels,
	                    datasets: sortedData.map((group, index) => ({
	                        label: group[0].label, // 각 그룹의 첫 번째 아이템의 라벨 사용
	                        data: group.map(item => item.ping),
	                        fill: false,
	                        pointRadius: 1
	                    }))
	                },
	                options: {
	                    legend: {
	                        display: false,
	                        position: 'bottom'
	                    },
	                    responsive: true
	                }
	            });
	        }
	    });
	}
 */

/*  function getSumGraph() {
	    let sumList = [];

	    $.ajax({
	        url: "/chart",
	        type: "get",
	        dataType: "json",
	        success: function(data) {
	            // 데이터 변환: 날짜 및 시간에서 월-일 추출하여 새로운 객체로 변환
	            sumList = data.map(item => ({
	                label: item.time.substring(5, 10), // 월-일 추출
	                time: item.time.substring(11, 19), // 시간 추출
	                ping: item.ping
	            }));
	            console.log(sumList);

	            // 각 날짜별로 시간별 ping 값을 그룹화하여 시간대 순서대로 정렬
	            const groupedData = sumList.reduce((acc, cur) => {
	                if (!acc[cur.label]) {
	                    acc[cur.label] = [];
	                }
	                acc[cur.label].push(cur);
	                return acc;
	            }, {});

	            // 시간대 순서대로 정렬된 데이터를 가진 배열 생성
	            const sortedData = Object.values(groupedData).map(group => group.sort((a, b) => a.time.localeCompare(b.time)));

	            // 각 날짜별로 첫 번째 시간을 라벨로 사용
	            const labels = Object.keys(groupedData);

	            // Chart.js 그래프 생성
	            new Chart(document.getElementById("line-chart").getContext('2d'), {
	                type: 'line',
	                data: {
	                    labels: labels,
	                    datasets: sortedData.map((group, index) => ({
	                        label: group[0].label, // 각 그룹의 첫 번째 아이템의 라벨 사용
	                        data: group.map(item => item.ping),
	                        borderColor: `hsl(${index * (360 / sortedData.length)}, 50%, 50%)`, // 랜덤한 컬러
	                        fill: false,
	                        pointRadius: 1
	                    }))
	                },
	                options: {
	                    legend: {
	                        display: true,
	                        position: 'bottom'
	                    },
	                    responsive: true,
	                    scales: {
	                        x: {
	                            display: true,
	                            title: {
	                                display: true,
	                                text: 'Date'
	                            }
	                        },
	                        y: {
	                            beginAtZero: true
	                        }
	                    }
	                }
	            });
	        }
	    });
	}
 */


</script>
