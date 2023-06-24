# frozen_string_literal: true

class ExportFileService < ApplicationService
  require 'rubyXL'

  attr_reader :employees

  def initialize(employees)
    @employees = employees
  end

  def call
    export_file_xlsx

    filename
  end

  private

  def export_file_xlsx
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]

    worksheet.add_cell(0, 0, 'Nome')
    worksheet.add_cell(0, 1, 'E-mail')
    worksheet.add_cell(0, 2, 'RG')
    worksheet.add_cell(0, 3, 'CPF')
    worksheet.add_cell(0, 4, 'Cargo')
    worksheet.add_cell(0, 5, 'Data de criação')
    worksheet.add_cell(0, 6, 'Data de atualização')

    employees.each_with_index do |employee, index|
      worksheet.add_cell(index + 1, 0, employee.name)
      worksheet.add_cell(index + 1, 1, employee.email)
      worksheet.add_cell(index + 1, 2, employee.register_number)
      worksheet.add_cell(index + 1, 3, employee.cpf)
      worksheet.add_cell(index + 1, 4, employee.role.name)
      worksheet.add_cell(index + 1, 5, employee.created_at.strftime('%d/%m/%Y'))
      worksheet.add_cell(index + 1, 6, employee.updated_at.strftime('%d/%m/%Y'))
    end

    workbook.write(filename)
  end

  def filename
    @filename ||= Rails.root.join('tmp/employees.xlsx')
  end
end
