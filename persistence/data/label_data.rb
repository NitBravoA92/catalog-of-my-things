require_relative '../file_manager'

module LabelData
  FILENAME = 'labels.json'

  include FileManager

  def get_all_labels
    data = read_file(file(FILENAME))
    data.map { |label|  json_to_label(label) }
  end

  def save_label(labels)
    data = labels.map { |label| label_to_json(label) }
    write_file(file(FILENAME), data)
  end

  def label_to_json(label)
    { 
      id: label.id, 
      title: label.title, 
      color: label.color,
      items: label.items.map(&:id)
    }
  end

  def json_to_label(label_json)
    Label.new(label_json['id'], label_json['title'], label_json['color'])
  end
end
