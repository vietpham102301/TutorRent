const itemList = document.querySelector('.item-list');
const gridViewBtn = document.getElementById('grid-active-btn');
const detailsViewBtn = document.getElementById('details-active-btn');

gridViewBtn.classList.add('active-btn');

gridViewBtn.addEventListener('click', () => {
    gridViewBtn.classList.add('active-btn');
    detailsViewBtn.classList.remove('active-btn');
    itemList.classList.remove('details-active');
    var elements = document.getElementsByClassName('post');
	    var elements = document.getElementsByClassName('item-img');
    for(var i in elements)
    {
	elements[i].style["padding-top"] = "40px";
}

});

detailsViewBtn.addEventListener('click', () => {
    detailsViewBtn.classList.add('active-btn');
    gridViewBtn.classList.remove("active-btn");
    itemList.classList.add("details-active");
    var elements = document.getElementsByClassName('item-img');
    for(var i in elements)
    {
	elements[i].style["padding-top"] = "0px";
}
//    var elements = document.getElementsByClassName('post');
//    for(var i in elements)
//    {
//		elements[i].style["text-align"] = "left";
//		elements[i].style["padding-left"] = "100px";
//		
//}
});