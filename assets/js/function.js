const deleteCate = (ele) => {
        let cateId = $(ele).attr("data-cate-id");
        console.log(cateId);
        $(".modal-footer .delete-cate-yes").val(cateId);
}

const editCate = (ele) => {
        console.log(ele);
        let cateId = $(ele).attr("data-cate-id");
        console.log(cateId);
        $(".modal-body .cateEditId").val(cateId);
}

function addNews(event) {
        event.preventDefault()
        var formData = $("#add-form").serialize();

        let quill = new Quill('.quill-editor-default')
        let quillText = quill.getText()
        let quill2 = new Quill('.quill-editor-full')
        let quillText2 = quill2.getText()


        formData += '&articleBody=' + quillText2
        formData += '&articleDescription=' + quillText
        console.log(formData);


        $.ajax({
          url: '/func_newsAdd.asp',
          type: 'GET',
          data: formData,
          contentType: false,
          success: function(data) {
            // Handle the response from the server
            console.log('Form submitted successfully', data);
            // You can redirect or perform any other actions here
          },
          error: function(error) {
            // Handle errors
            console.error('Error submitting form', error);
          }
        });
      }
      
      

