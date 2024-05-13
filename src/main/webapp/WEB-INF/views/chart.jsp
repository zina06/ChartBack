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
	                const datetime = data[i].time; // ��¥�� �ð� �� ��������
	                const date = datetime.split(' ')[0]; // ��¥ �κи� �����ϱ�
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
	                const datetime = data[i].time; // ��¥�� �ð� �� ��������
	                const date = datetime.split(' ')[0]; // ��¥ �κи� �����ϱ�
	                sumList.push({ date: date, ping: data[i].ping }); // ��¥�� date�� �����Ͽ� sumList�� �߰�
	            }
	            console.log(sumList); 

	            new Chart(document.getElementById("line-chart"), {
	                type: 'line',
	                data: {
	                    labels: Array.from(new Set(sumList.map(item => item.date))), // �ߺ����� �ʴ� ��¥ �迭 �����Ͽ� x�� �󺧷� ����
	                    datasets: [{ 
	                        data: sumList.map(item => item.ping), // ping ������ ���
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
	            // ������ ��ȯ: ��¥ �� �ð����� ��-��, �ð� �����Ͽ� ���ο� ��ü�� ��ȯ
	            sumList = data.map(item => ({
	                label: item.time.substring(5, 10), // ��-�� ����
	                time: item.time.substring(11, 19), // �ð� ����
	                ping: item.ping
	            }));
	            console.log(sumList);

	            // �� ��¥���� �ð��� ping ���� �׷�ȭ�Ͽ� �ð��� ������� ����
	            const groupedData = sumList.reduce((acc, cur) => {
	                if (!acc[cur.label]) {
	                    acc[cur.label] = [];
	                }
	                acc[cur.label].push(cur);
	                return acc;
	            }, {});

	            // �ð��� ������� ���ĵ� �����͸� ���� �迭 ����
	            const sortedData = Object.values(groupedData).map(group => group.sort((a, b) => a.time.localeCompare(b.time)));

	            // ù ��° ��¥�� �ð��� �󺧷� ���
	            const labels = sortedData[0].map(item => item.time);

	            // Chart.js �׷��� ����
	            new Chart(document.getElementById("line-chart").getContext('2d'), {
	                type: 'line',
	                data: {
	                    labels: labels,
	                    datasets: sortedData.map((group, index) => ({
	                        label: group[0].label, // �� �׷��� ù ��° �������� �� ���
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
	            // ������ ��ȯ: ��¥ �� �ð����� ��-�� �����Ͽ� ���ο� ��ü�� ��ȯ
	            sumList = data.map(item => ({
	                label: item.time.substring(5, 10), // ��-�� ����
	                time: item.time.substring(11, 19), // �ð� ����
	                ping: item.ping
	            }));
	            console.log(sumList);

	            // �� ��¥���� �ð��� ping ���� �׷�ȭ�Ͽ� �ð��� ������� ����
	            const groupedData = sumList.reduce((acc, cur) => {
	                if (!acc[cur.label]) {
	                    acc[cur.label] = [];
	                }
	                acc[cur.label].push(cur);
	                return acc;
	            }, {});

	            // �ð��� ������� ���ĵ� �����͸� ���� �迭 ����
	            const sortedData = Object.values(groupedData).map(group => group.sort((a, b) => a.time.localeCompare(b.time)));

	            // �� ��¥���� ù ��° �ð��� �󺧷� ���
	            const labels = Object.keys(groupedData);

	            // Chart.js �׷��� ����
	            new Chart(document.getElementById("line-chart").getContext('2d'), {
	                type: 'line',
	                data: {
	                    labels: labels,
	                    datasets: sortedData.map((group, index) => ({
	                        label: group[0].label, // �� �׷��� ù ��° �������� �� ���
	                        data: group.map(item => item.ping),
	                        borderColor: `hsl(${index * (360 / sortedData.length)}, 50%, 50%)`, // ������ �÷�
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
