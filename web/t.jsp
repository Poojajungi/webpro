<%@page import="org.hibernate.*"%>
<%@page import="model.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
       <title>Page Redirect with Loader</title>
  <style>
  /* From Uiverse.io by pradipkaityuiux */ 
.loader {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 150px;
  height: 150px;
  background: transparent;
  border: 3px solid rgba(0, 102, 255, 0.1);
  border-radius: 50%;
  text-align: center;
  line-height: 150px;
  font-family: sans-serif;
  font-size: 20px;
  color: #0066ff;
  letter-spacing: 2px;
  text-transform: uppercase;
  text-shadow: 0 0 10px #0066ff;
  box-shadow: 0 0 20px rgba(0, 0, 0, .15);
}

.loader::before {
  content: '';
  position: absolute;
  top: -3px;
  left: -3px;
  width: 100%;
  height: 100%;
  border: 3px solid transparent;
  border-top: 3px solid #0066ff;
  border-right: 3px solid #0066ff;
  border-radius: 50%;
  animation: animateC 2s linear infinite;
}

.loader span {
  display: block;
  position: absolute;
  top: calc(50% - 2px);
  left: 50%;
  width: 50%;
  height: 4px;
  background: transparent;
  transform-origin: left;
  animation: animate 2s linear infinite;
}

.loader span::before {
  content: '';
  position: absolute;
  width: 16px;
  height: 16px;
  border-radius: 50%;
  background: #00aeff;
  top: -6px;
  right: -8px;
  box-shadow: 0 0 20px 5px #0066ff;
}

@keyframes animateC {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

@keyframes animate {
  0% {
    transform: rotate(45deg);
  }

  100% {
    transform: rotate(405deg);
  }
}
  </style>
</head>
<body>
  <h1>Click to Redirect</h1>
  <button id="redirectButton">Go to Another Page</button>

  <div class="loader" style="display: none;" id="loader">Loading
  <span></span>
</div>

  <script>
    document.getElementById('redirectButton').addEventListener('click', function () {
       
      const loader = document.getElementById('loader');
      loader.style.display = 'block';

      // Simulate loading before redirection
      setTimeout(() => {
        window.location.href = 'Loginnjsp.jsp';
      }, 2000); // Delay of 2 seconds
    });
  </script>
</body>
</html>