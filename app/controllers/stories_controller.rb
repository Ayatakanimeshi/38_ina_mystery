class StoriesController < ApplicationController
  def new

  end

  def show

    @script_texts = ["数が減ってるんだよ。十時に見た時は、五個あったんだぞっ。今は四個しかない",
                    "ドッペルゲンガーは自分の分身だから、記憶も共有してるんだろうか。僕の生活と全く同じだ",
                    "この目の前でブランコを漕いでいるのが、僕のドッペルゲンガーだ。ドッペルゲンガーだから、僕の分身になる。同じ顔なのはもちろん、名前も同じだった。けど、それだと話しづらいから、祐二って呼ぶことにした。本人も、あっさりと受け入れてくれた"] # 実際のテキストを代入する
    @backgrounds = ['back_01.png','back_02.png','back_03.png']
    
   end

end
