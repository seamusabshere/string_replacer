require 'fileutils'

class StringReplacer
  NEWLINE = "AijQA6tD1wkWqgvLzXD"
  START_MARKER = '# START StringReplacer %s -- DO NOT MODIFY'
  END_MARKER = "# END StringReplacer %s -- DO NOT MODIFY#{NEWLINE}"
  
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  
  def replace!(string, replacement_id, after_line)
    replacement_id = 1 unless replacement_id.to_s.strip.length > 0
    after_line = nil unless after_line.to_s.strip.length > 0
    new_path = "#{path}.new"
    backup_path = "#{path}.bak"
    current_start_marker = START_MARKER % replacement_id.to_s
    current_end_marker = END_MARKER % replacement_id.to_s
    string_with_markers = current_start_marker + NEWLINE + string + NEWLINE + current_end_marker
    text = IO.read(path).gsub("\n", NEWLINE)
    if text.include? current_start_marker
      text.sub! /#{Regexp.escape current_start_marker}.*#{Regexp.escape current_end_marker}/, string_with_markers
    elsif after_line
      text.sub! /(#{Regexp.escape after_line}#{Regexp.escape NEWLINE})/, '\1' + string_with_markers
    else
      text << NEWLINE << string_with_markers
    end
    text.gsub! NEWLINE, "\n"
    File.open(new_path, 'w') { |f| f.write text }
    FileUtils.mv path, backup_path
    FileUtils.mv new_path, path
  end
end
