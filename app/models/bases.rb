class Bases < ApplicationRecord
    validates :office_no, presence: true, uniqueness: true
    validates :office_name, presence: true, length: { maximum: 10}
    validates :work_kind, presence: true, length: { maximum:10}, uniqueness: true
end
