<?php
@ob_start();
session_start();
include 'config.php';
if (!isset($_SESSION['status'])) {
} else {
    header('location:index.php');
}
;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="favicon.ico">
    <link rel="icon" href="icon.ico" type="image/ico">
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="assets/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
    
</head>

<body class="bg-dark">
    <?php
    if (isset($_POST['login'])) {
        $user = mysqli_real_escape_string($conn, $_POST['username']);
        $pass = mysqli_real_escape_string($conn, $_POST['password']);
        $queryuser = mysqli_query($conn, "SELECT * FROM login WHERE username='$user'");
        $cariuser = mysqli_fetch_assoc($queryuser);

        if (password_verify($pass, $cariuser['password'])) {
            $_SESSION['id_login'] = $cariuser['id_login'];
            $_SESSION['username'] = $cariuser['username'];
            $_SESSION['nama_toko'] = $cariuser['nama_toko'];
            $_SESSION['alamat'] = $cariuser['alamat'];
            $_SESSION['telepon'] = $cariuser['telepon'];
            $_SESSION['status'] = "login";

            if ($cariuser) {
                echo '<script>alert("Data yang anda masukan benar");window.location="index.php"</script>';
            } else {
                echo '<script>alert("Data yang anda masukan salah");history.go(-1);</script>';
            }
            echo '<script>alert("Anda Berhasil Login");window.location="index.php"</script>';
        } else {
            echo '<script>alert("Username atau password salah");history.go(-1);</script>';
        }
    }
    ;

    ?>
    <div class="container">
        <br><br><br><br><br><br>

        <div class="row justify-content-center">

            <div class="col-sm-8 col-md-6 col-lg-4">
                <h1 class="h3 text-center mb-3" style="font-weight:600;=">Altara<span class="text-primary">Retail</span>
                </h1>
                <div class="card-body bg-white shadow-sm">
                    <form method="POST">
                        <label for="user">Username</label>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa fa-user"></i></div>
                            </div>
                            <input type="text" class="form-control" id="user" name="username" placeholder="Username"
                                required>
                        </div>

                        <label for="pass">Password</label>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa fa-lock"></i></div>
                            </div>
                            <input type="password" class="form-control" id="pass" name="password" placeholder="Password"
                                required>
                        </div>
                        <div class="row">
                            
                            <div class="col-12 pl-2,5 mt-1" >
                                <button class="btn btn-primary btn-block" name="login" type="submit">
                                    <i class="fa fa-sign-in-alt mr-1"></i> Login</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="text-center small mt-4">
                    <p class="text-muted small mb-0">Copyright &copy; <a href="https://www.instagram.com/altaaraaa" ;>
                            <?php echo date("Y"); ?>
                            <b>ALTARA</b>
                        </a>. All Rights Reserved
                    </p>
                </div>
            </div>

        </div>


    </div> <!-- end container fluid -->

    <script src="assets/js/jquery.slim.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>

</html>