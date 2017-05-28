def generate_tiles
  tiles = []
  (0..6).each { |i|
    (0..i).each { |j| 
      tiles.push([i, j])
    }
  }
  tiles
end

print generate_tiles
