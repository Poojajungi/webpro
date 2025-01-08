<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
    <script>
        function loadGoogleTranslate() {
            new google.translate.TranslateElement({
                pageLanguage: 'en', // Default language
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE 
            }, 'myid');

            // Attach an event listener to the select element within the Google Translate widget
            document.addEventListener('DOMContentLoaded', function() {
                var selectElement = document.querySelector('.goog-te-combo');
                selectElement.addEventListener('change', function() {
                    var selectedLang = selectElement.value;
                    console.log("Selected language:", selectedLang); 
                    // Do something with the selected language here
                });
            });
        }
    </script>
</head>
<body>
    <div id="myid">Choose Language</div>
</body>
</html>