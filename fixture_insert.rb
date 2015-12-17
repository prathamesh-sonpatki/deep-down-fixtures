# Inserts the given fixture into the table. Overridden in adapters that require
# something beyond a simple insert (eg. Oracle).
def insert_fixture(fixture, table_name)
  columns = schema_cache.columns_hash(table_name)

  key_list   = []
  value_list = fixture.map do |name, value|
    key_list << quote_column_name(name)
    quote(value, columns[name])
  end

  execute "INSERT INTO #{quote_table_name(table_name)} (#{key_list.join(', ')}) VALUES (#{value_list.join(', ')})", 'Fixture Insert'
end
