import 'selectize/dist/js/selectize.min.js';
import 'selectize/dist/css/selectize.css';

const selectize = () => {
  $('.selectize').selectize({
    // create: true, (from example on selectize page)
    // sortField: 'text'
    // maxItems: 1,
    create: function(input, callback) {
      console.log(input)
      $(".button-modal").click();

      $("#booking_flat_id-selectized").on('change', function(){
        $("#flat_street").val(input);
        $("#new_flat").removeClass("d-none")
        $("#new_tenant").addClass("d-none")
        $("#new_flat").on("submit", function(e) {
          e.preventDefault();
          $.ajax({
            method: "POST",
            url: $(this).attr("action"),
            data: $(this).serialize(),
            success: function(response){
              callback({value: response.id, text: response.street});
              $(".button-modal").click();
              $.rails.enableFormElements($("#new_flat"))
            }
          })
        })
      });

      $("#booking_tenant_id-selectized").on('change', function(){
        $("#tenant_first_name").val(input);
        $("#new_tenant").removeClass("d-none")
        $("#new_flat").addClass("d-none")
        $("#new_tenant").on("submit", function(e) {
          e.preventDefault();
          $.ajax({
            method: "POST",
            url: $(this).attr("action"),
            data: $(this).serialize(),
            success: function(response){
              callback({value: response.id, text: response.first_name});
              $(".button-modal").click();
              $.rails.enableFormElements($("#new_tenant"))
            }
          })
        })
      });
    }
  });

  // $('.selectize-deliverable').selectize({
  //   // create: true, (from example on selectize page)
  //   // sortField: 'text'
  //   create: function(input, callback) {
  //     $(".deliverable-modal").modal();
  //     $("#deliverable_name").val(input);

  //     $("#new_deliverable_form").on("submit", function(e) {
  //       e.preventDefault();
  //       $.ajax({
  //         method: "POST",
  //         url: $(this).attr("action"),
  //         data: $(this).serialize(),
  //         success: function(response){
  //           callback({value: response.id, text: response.title});
  //           $(".deliverable-modal").modal("toggle");
  //           console.log("closed")
  //         }
  //       });
  //     });
  //   }
  // });

};

export { selectize };
