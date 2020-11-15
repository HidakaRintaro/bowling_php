<?php
require_once './const.php';

$name = $_POST['name'];

$link = @mysqli_connect(HOST, USER_ID, PASSWORD, DB_NAME);
// DBの接続情報のエラー処理
if (!$link) {
  $err_msg = '予期せぬエラーが発生しました。しばらくたってから再度お試しください。';
  require './tpl/error.php';
  exit;
}
mysqli_set_charset($link, 'utf8');

$sql = "INSERT INTO user (name) VALUES ('".$name."')";
$result = mysqli_query($link, $sql);

// SQLのエラー処理
if (!$result) {
  mysqli_close($link);
  $err_msg = '予期せぬエラーが発生しました。しばらくたってから再度お試しください。';
  require './tpl/error.php';
  exit;
}
$id = mysqli_insert_id($link);
mysqli_close($link);





require_once './tpl/create_user.php';