require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480)
    self.caption = "ノベルゲーム"
    @start_button = Gosu::Image.new("始まりのボタン.png")
    @start_button_x = 30
    @start_button_y = 30
    @start_button_draw_true = true


    @start_cancel = Gosu::Image.new("終了のボタン.png")
    @start_cancel_x = 60
    @start_cancel_y = 30
    @start_cancel_draw_true = true
    
    @haikei_image = Gosu::Image.new("背景.png")
    
    @yes_button = Gosu::Image.new("YESのボタン.png")
    @yes_button_x = 30
    @yes_button_y = 30
    @yes_button_draw_true = false
    
    @no_button = Gosu::Image.new("NOのボタン.png")
    @no_button_x = 60
    @no_button_y = 30
    @no_button_draw_true = false  
  end

  def update #update のところで、↓の関数を呼び出しています。
    new_game
    leave_game
    draw
  end  
    
    
  def new_game  #ここは一応テストでゲームが始まるとしか表示されません
    if id == Gosu::MS_LEFT
      if click_start_button
        puts "ゲームが始まる"
      end
    end
  end # def 終了
  

  def leave_game
    if id == Gosu::MS_LEFT
      if click_leave_button
        close
      end
    end
  end


  def click_start_button
     mouse_x >= @start_button_x && mouse_x <= @start_button_x + @start_button_x.width &&
      mouse_y >= @start_button_y && mouse_y <= @start_button_y + @start_button_y.height
    end









  def click_leave_button
    mouse_x >= @start_cancel_x && mouse_x <= @start_cancel_x + @start_cancel_x.width &&
      mouse_y >= @start_cancel_y && mouse_y <= @start_cancel_y + @start_cancel_y.height
  end












  def draw
    @haikei_image.draw(0, 0, 1, 1)
    if @start_button_draw_true
      @start_button.draw(@start_button_x, @start_button_y, 1, 1)
    end
    if @start_cancel_draw_true
      @start_cancel.draw(@start_cancel_x, @start_cancel_y, 1, 1)
    end
    if @yes_button_draw_true 
      @yes_button.draw(@yes_button_x, @yes_button_y, 1, 1)
    end
    if @no_button_draw_true
      @no_button.draw(@no_button_x, @no_button_y, 1, 1)    
    end
  end
end

GameWindow.new.show
