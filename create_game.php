<?php
require_once './const.php';

if (isset($_POST['venue']) && isset($_POST['date'])) {
  $venue = $_POST['venue'];
  $game_date = $_POST['date'];
  
  $link = @mysqli_connect(HOST, USER_ID, PASSWORD, DB_NAME);
  // DBの接続情報のエラー処理
  if (!$link) {
    $err_msg = '予期せぬエラーが発生しました。しばらくたってから再度お試しください。';
    require './tpl/error.php';
    exit;
  }
  mysqli_set_charset($link, 'utf8');
  
  $sql = "INSERT INTO game (venue, game_date) VALUES ('".$venue."', '".$game_date."')";
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

  header('location: ./score.php?venue='.$venue.'&game_date='.$game_date);
  exit;
}


require_once './tpl/create_game.php';