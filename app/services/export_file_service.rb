# frozen_string_literal: true

class ExportFileService < ApplicationService
  require 'rubyXL'

  attr_reader :employees

  def initialize(employees)
    @employees = employees
  end

  def call
    create_file

    filename
  end

  private

  def create_file
    workbook = RubyXL::Workbook.new
    worksheet = create_columns(workbook)
    create_rows(worksheet)

    workbook.write(filename)
  end

  def create_rows(worksheet)
    employees.each_with_index do |employee, index|
      worksheet.add_cell(index + 1, 0, employee.name)
      worksheet.add_cell(index + 1, 1, employee.email)
      worksheet.add_cell(index + 1, 2, employee.register_number)
      worksheet.add_cell(index + 1, 3, employee.cpf)
      worksheet.add_cell(index + 1, 4, employee.role.name)
      worksheet.add_cell(index + 1, 5, employee.created_at.strftime('%d/%m/%Y'))
      worksheet.add_cell(index + 1, 6, employee.updated_at.strftime('%d/%m/%Y'))
    end
  end

  def create_columns(workbook)
    worksheet = workbook[0]

    columns_name.each_with_index do |column, index|
      worksheet.add_cell(0, index, column)
    end

    worksheet
  end

  def columns_name
    %w[Nome E-mail RG CPF Cargo Criação Atualização]
  end

  def filename
    @filename ||= Rails.root.join('tmp/employees.xlsx')
  end
end
