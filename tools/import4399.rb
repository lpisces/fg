require "rubygems"
require "sequel"
require "mysql2"

DB = Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :database=>'game', :user=>'root', :password=>'')
DB2 = Sequel.connect(:adapter=>'mysql2', :host=>'localhost', :database=>'fg', :user=>'root', :password=>'')

DB.fetch("SELECT * FROM g4399") do |row|
  sql_insert_category = 'INSERT INTO categories (name, created_at, updated_at) values (?, ?, ?)'
  sql_find_category = 'SELECT * FROM  categories where name = ?'
  DB2[sql_insert_category, row[:category], Time.now, Time.now].insert if DB2[sql_find_category, row[:category]].all.empty?


  sql_insert_items = 'INSERT INTO items (name, bimg, simg, size, `desc`, start, target, operate, category, category_id, tags, play_link, source, created_at, updated_at) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
  sql_find_item = 'SELECT * FROM  items where play_link = ?'
  category = DB2[sql_find_category, row[:category]].all.first
 
  desc = (row[:summary].nil? || row[:summary].strip.empty?) ? row[:introduce] : row[:summary]
  source = '4399'
  puts row.to_s
  DB2[sql_insert_items, row[:title], row[:bimg], row[:simg], row[:size], desc, row[:start], row[:target], row[:operate], category[:name], category[:id], row[:tags], row[:play_link], source, Time.now, Time.now].insert if DB2[sql_find_item, row[:play_link]].all.empty?
  item = DB2[sql_find_item, row[:play_link]].all.first


  sql_insert_tag = 'INSERT INTO tags (name, created_at, updated_at) value (?, ?, ?)'
  sql_find_tag = 'SELECT * FROM  tags where name = ?'
  row[:tags].split('|').each do |t|
    next if t.nil? || t.to_s.empty?
    DB2[sql_insert_tag, t, Time.now, Time.now].insert if DB2[sql_find_tag, t].all.empty?

    tag = DB2[sql_find_tag, t].all.first

    sql_insert_items_tags = 'INSERT INTO items_tags (item_id, tag_id) values (?, ?)'
    DB2[sql_insert_items_tags, item[:id], tag[:id]].insert
    puts "#{item[:name]} #{tag[:name]}"
  end


end

