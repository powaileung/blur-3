# define a class
class Image
  # this method build on a array contain 4 array with 4 items in each array.
  # name blur 
  def initialize(image)
    @image = image
  end 
# this method is to locate where is the ones in row.
  def get_ones
    ones = []
    @image.each_with_index do |row, i|
      row.each_with_index do |x, col|
        if x == 1
          ones << [i, col]
        end
      end
    end
   return ones
  end
  # this method is to build command to blur [] next to ones and defining blur
  def blur!(distance)
    ones = get_ones
      @image.each_with_index do |row, i|
        row.each_with_index do |x, col|
          ones.each do |found_i, found_col|

            if manhattan_distance(col, i, found_col, found_i) <= distance
              @image[i][col] = 1
            end
          end
        end
      end
    end


  def manhattan_distance (a1, b1, a2, b2)
    horizontal_distance = (a2 - a1).abs
    vertical_distance = (b2 - b1).abs
    horizontal_distance + vertical_distance
  end

# this method define image
# need method in class to output image of array
  def output_image
    @image.each { |image| puts image.join() }
  end
end

#test
image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1],
])

# output_image
puts
image.blur!(3)
image.output_image
