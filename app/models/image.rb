class Image < ApplicationRecord
belongs_to :hack
def image=(uploaded_io)
  File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |file|
    file.write(uploaded_io.read)
  end
  write_attribute(:image, uploaded_io.original_filename)
rescue
  write_attribute(:image, uploaded_io)
end
def image
  read_attribute(:image)
end

end
