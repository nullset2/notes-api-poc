require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "notes cannot be created without a title" do
    note = Note.create(content: "it actually has content you know!")
    assert_not note.save
  end

  test "notes cannot be created with a title longer than 140 characters" do
    note = Note.new(title: SecureRandom.hex(141)) 
    assert_not note.save
  end

  test "that notes can be created without content" do
    assert Note.create(title: "The Mysterious Case of the Limbless Note", content: "")
  end


end
