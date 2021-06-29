
var property_row =2;

$(document).ready(function(){
    property_row = 2;
});


// add new relation field
function addRelations(){
    //  html elements
    var text = '<tr><div class="row"><td><div class="form-group">';
    text += '<input type="text"  name="pid" class="form-control" placeholder="NIC Number" required="required" maxlength="12"></div></div>';
    text += '<div class="form-group"><input type="text" name="status" class="form-control" placeholder="Status (Ex: Husband)" required="required" maxlength="10"></div></td>';
    text += '<td><button id="btn_remove" class="btn btn-danger btn-xa" >X</button></td>';
    text += '</tr>'
    //   append html 
    $("#relation-container").append(text);
}
//   add new dependent field
function addDependent(){
    //  html elements
    var text = '<tr><td><div class="form-group">';
    text += '<input type="text" name="Name" class="form-control" placeholder="Name" required="required" maxlength="15"></div></td>';
    text += '<td><button id="btn_remove" class="btn btn-danger btn-xa" >X</button></td>'; 
    text += '</tr>';
    //  append html
    $("#dependent-container").append(text);
}
// add new property field
function addProperty(){
    //  get template
    var text = $("#property-template")[0];
    //  append html as div element with id 
    $(".property-container").append('<div id="property_'+property_row+'"> '+text.innerHTML+'</div>');
    //  increase id
    property_row ++;
    
}
//  add new cultivate land field
function addCland(ev){
    //get parent id
    var parent = $(ev).parent().parent().attr("id");
    //  html elements
    var text = '<tr><td><div class="form-group">';
    text += '<input type="text" name="crops" class="form-control" placeholder="Crops" required="required" maxlength="20"></div></td>\
    <td><button id="btn_remove" class="btn btn-danger btn-xa" >X</button></td>'; 
    text += '</tr>';
    //  append html to parent container
    $("#"+parent+ " "+ "#clands-container").append(text);
}
// add new house field
function addHouse(ev){
    //  get parent id 
    var parent = $(ev).parent().parent().attr("id");
    //  html element
    var text = '<tr><td><div class="form-group">';
    text += '<input type="text" name="hassement_no" class="form-control" placeholder="House Assesment Number" required="required" maxlength="5"></div></td>';
    text += '<td><button id="btn_remove" class="btn btn-danger btn-xa" >X</button></td>'; 
    text += '</tr>';
    //  appendd html to parent container
    $("#"+parent+ " "+"#house-container").append(text);
}
// add new shop field
function addShop(ev){
    //  get parent id
    var parent = $(ev).parent().parent().attr("id");
    //  html element
    var text = '<tr><div class="row" ><td><div class="form-group">';
    text += '<input type="text" name="reg_no" class="form-control" placeholder="Registration Number" required="required" maxlength="5"></div></div>';
    text += '<div class="form-group">';
    text += '<input type="text" name="name" class="form-control" placeholder="Name" required="required" maxlength="15"></div></td>';
    text += '<td><button id="btn_remove" class="btn btn-danger btn-xa" >X</button></td>'; 
    text += '</tr>';
    //  append html to parent container
    $("#"+parent+ " "+"#shop-container").append(text);
}

// remove data fields on btn_remove click
$(document).on('click' ,'#btn_remove',function(){
    var parent = $(this).parent().parent();
    parent.remove();
});

