
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewImport</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CSS/stock.css"/>
    </head>
    <body class="backdesign overflow-hidden vh-100">
        <div class="container-fluid " >
            <form>
                <h2 class="text-center mt-3">View Import Stock</h2>
                <div class="d-flex align-items-center gap-2">
                    <div class="fw-bold text-white">Click Here To Import Stock</div>
                    <div>
                        <button type="submit" class="btn btn-light fw-bold btn-sm btn-outline-primary">
                            <i class="fas fa-square-plus " ></i>
                            Import Stock
                        </button>
                    </div>
                </div>
                <table class="table table-bordered mt-3 table-sm">
                    <tr>
                        <th>#</th>
                        <th>Boat/Owner Name</th>
                        <th>Fish Name</th>
                        <th>Date</th>
                        <th>Quantity</th>
                        <th>Amount</th>
                        <th>Total Amount</th>
                    </tr>
                </table>
                <div>
                </div>
            </form> 
        </div>
    </body>
</html>