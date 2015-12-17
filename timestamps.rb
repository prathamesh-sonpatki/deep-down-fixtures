now = config.default_timezone == :utc ? Time.now.utc : Time.now
now = now.to_s(:db)

if model_class.record_timestamps
  timestamp_column_names.each do |c_name|
    row[c_name] = now unless row.key?(c_name)
  end
end
