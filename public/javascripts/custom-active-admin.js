$(document).ready(function() {
    var loc = window.location.href,
        uploader;
    
    var uploader = new qq.FileUploader({
        element: document.getElementById('file-uploader'),
        action: loc.replace("edit","pictures"),
        debug: true,
        onSubmit: function(id, fileName){},
        onProgress: function(id, fileName, loaded, total){},
        onComplete: function(id, fileName, responseJSON){},
        onCancel: function(id, fileName){return false}
    });
});
