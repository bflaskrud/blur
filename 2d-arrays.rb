class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join
    end

  

end

  def blur(distance=1)
    distance.times do
    ones = find_ones
    
    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, column_index|
        # [3,1]
        ones.each do |one_row, one_column|
          #puts "#{row_index} - #{column_index}"
          #puts "#{one_row} - #{one_column}"
          ##puts "-------------------"

          if column_index == one_column && row_index == one_row
            @image[row_index-1][column_index] = 1 if row_index >= 1
            @image[row_index+1][column_index] = 1 if row_index < 5
            @image[row_index][column_index-1] = 1 if column_index > 0
            @image[row_index][column_index+1] = 1 if column_index < 3

          end 
        end
        # look at the ones coordinates and compare them to the pixel
        # if it's a match, change the surrounding pixels
      end
    end 
  end
    output_image
  end
  # iterate over the image rows and columns again
  # compare each pixel's coordinates with the coords of the ones

  def find_ones
     # @image.each { |row| row.each { |pixel| ... } }
    cords = []


    @image.each_with_index do |row, row_index|
      # row = [0, 1, 0, 0]
      # puts "#{row_index} - ROW"
      row.each_with_index do |pixel, column_index|
        # pixel = 0
        # puts "#{column_index} - COLUMN"
        if pixel == 1
          # save the coordinates
          cords << [row_index, column_index]
        end
      end
    end

    #puts cords.inspect
    cords
  end
end 

# find_ones = [[3,1]]

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
])

 #image.output_image
image.blur(2)