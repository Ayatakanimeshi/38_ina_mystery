document.addEventListener('DOMContentLoaded', function() {
  //要素を取得
  const scriptText = document.getElementById('script-text');
  const scriptBox = document.getElementById('script-box');
  const backgroundBox = document.getElementById('background-box');
  
  //htmlから文字列を取得し、配列としてパース
  let texts = JSON.parse(document.getElementById('texts-value').value);
  const backgrounds = JSON.parse(document.getElementById('backgrounds-value').value);
  //子要素を初期化
  scriptText.innerText = '';

  //配列のインデックス
  let currentIndex = 0;
  let intervalId;
  let backgroundId = 0

  //テキストの描画が進行中かどうかのフラグ
  let isDisplaying = false;

  //テキストを一文字ずつ表示するメソッド
  function displayText(text) {
    isDisplaying = true;
    //const text = texts[currentIndex];
    scriptText.innerText = '';
    let index = 0;
    intervalId = setInterval(function() {
      if (index < text.length) {
        scriptText.innerText += text.charAt(index);
        index++;
      } else {
        //テキストを全文字描画した場合
        clearInterval(intervalId);
        isDisplaying = false;
        currentIndex++;
      }
    }, 100);
  }

  //次のテキストを表示するメソッド
  function displayNextText() {
    if (isDisplaying) {
      // テキストが表示中の場合は何もしない
      return;
    }
    
    //textsの要素の数文displayTextを実行する
    if (currentIndex < texts.length) {
      displayText(texts[currentIndex]);
    } else {
      // 最後のテキストまで表示された後の処理
      changeScene();
      backgroundId ++
    };
  };

  //テキスト要素にイベントリスナーを加える
  scriptBox.addEventListener('click', function() {
    if (isDisplaying) {
      clearInterval(intervalId);
      // テキストが表示中の場合は何もしない
      scriptText.innerText = texts[currentIndex];
      isDisplaying = false;
      currentIndex++;
    }else{
       // テキストを空にする
      scriptText.innerText = '';
      // 次のテキストを一文字ずつ表示する処理を呼び出す
      displayNextText();
    }
  });
  //1回目の実行
  displayText(texts[0]);

  //背景チェンジの関数
  function changeScene(){
    backgroundBox.style.backgroundImage = `url('/images/${backgrounds[backgroundId]}')`;
  };
});
