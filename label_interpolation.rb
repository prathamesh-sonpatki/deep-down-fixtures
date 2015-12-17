# interpolate the fixture label
row.each do |key, value|
  row[key] = value.gsub("$LABEL", label) if value.is_a?(String)
end
