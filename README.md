


file = File.open("/tmp/test.jpg", "w") { |f| IO.copy_stream(open("http://res.cloudinary.com/dp4vga3rz/image/upload/v1528146744/mduzxuoqqdwqbznqhamb.jpg"), f) }

file.path -> [file1.path, file2.path, file3.path, ...]
