document.addEventListener('DOMContentLoaded', function() {
  const scriptText = document.getElementById('script-text');
  const scriptBox = document.getElementById('script-box')
  let text = scriptText.innerText;
  scriptText.innerText = '';

  let index = 0;
  let intervalId;

  // 100ミリ秒ごとに一文字ずつ描画する関数
  function drawText() {
    if (index < text.length) {
      scriptText.innerText += text.charAt(index);
      index++;
    } else {
      clearInterval(intervalId);
    }
  }

  // 100ミリ秒ごとに一文字ずつ描画するタイマーを開始
  intervalId = setInterval(drawText, 100);

  // ダブルクリックイベントリスナー
  scriptBox.addEventListener('click', function() {
    // タイマーを停止して、全てのテキストを表示
    clearInterval(intervalId);
    scriptText.innerText = text;
  });
});
