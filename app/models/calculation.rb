class Calculation < ApplicationRecord
  validates :bill, presence: true, numericality: { greater_than: 0 }
  validates :tip, presence: true, numericality: { greater_than: 0 }
  validates :people, presence: true, numericality: { greater_than: 0 }

  def tip_per_person
    return 0 if people.nil? || people.zero?
    (tip * bill) / (100.00 * people)
  end

  def total_per_person
    return 0 if people.nil? || people.zero?
    (((bill * 1.00) / people) + tip_per_person.to_f).round(2)
  end
end
