# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @q = Employee.ransack(params[:q])

    @employees = @q.result(distinct: true).includes(:role).page params[:page]
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: 'Funcionário cadastrado com sucesso!'
    else
      render :new
    end
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Funcionário atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])

    @employee.destroy

    redirect_to employees_path, notice: 'Funcionário excluído com sucesso!'
  end

  def export_file
    file = ExportFileService.call(Employee.includes(:role).all)

    if file.present?
      download_file(file)
    else
      redirect_to employees_path, notice: 'Não foi possível gerar o arquivo'
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :register_number, :cpf, :role_id)
  end

  def download_file(file)
    send_file(
      file,
      filename: 'employees.xlsx',
      type: 'application/xlsx',
      disposition: 'attachment'
    )
  end
end
