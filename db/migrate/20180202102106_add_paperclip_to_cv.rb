class AddPaperclipToCv < ActiveRecord::Migration[5.1]
  def change
    add_attachment :cvs, :head_pic
    add_attachment :cvs, :body_pic
  end
end
