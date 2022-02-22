document.addEventListener("DOMContentLoaded",() => {
 function counter ( id, start, end, duration){
 	let obj = document.getElementById(id),
 	current = start,
 	range = end - start,
 	increment = end> start ? 1 : -1,
 	step = math.abs(math.floor(duration/range)),
 	timer = setInterval(() => {
     current += increment;
     obj.textContent = current;
     if(current == end){
     	clearInterval(timer);
     }

 	}, step);
 }
 couter("count",0,1287,3000);
 couter("count",0,5786,2500);
 couter("count",0,1440,3000);
 couter("count",0,17110,3000);
});