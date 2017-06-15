require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table User' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :company_name }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :state }
    it { is_expected.to have_db_column :zip_code }
    it { is_expected.to have_db_column :country }
    it { is_expected.to have_db_column :contractor_experience }
    it { is_expected.to have_db_column :contractor_description }
    it { is_expected.to have_db_column :insurance }
  end

  describe 'Validations' do
    context "if contractor" do
      before { allow(subject).to receive(:role).and_return('contractor') }
      it { is_expected.to validate_presence_of :address }
      it { is_expected.to validate_presence_of :city }
      it { is_expected.to validate_presence_of :state }
      it { is_expected.to validate_presence_of :zip_code }
      it { is_expected.to validate_presence_of :country }
    end

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :encrypted_password }

  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end
end