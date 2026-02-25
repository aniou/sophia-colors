#!/usr/bin/ruby


fname_in  = ARGV[0]
fname_out = fname_in.sub("rgb24-", "")
fname_out = "rgb18-" + fname_out

magic     = 63.0 / 255.0
fout      = File.open(fname_out, 'wb')

File.read(fname_in).each_byte do |b| 
  out = b * magic
  puts "%02x %3d %3d %f" % [b, b, out.floor(), out]
  fout.write([out.floor()].pack('C'))
end

fout.close()
