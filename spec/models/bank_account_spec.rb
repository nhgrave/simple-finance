require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  describe '#name' do
    context "when set a value" do
      subject { BankAccount.new(name: 'Wallet' ) }

      it { expect(subject.name).to eq 'Wallet' }
    end

    context "when is default" do
      it { expect(subject.name).to eq '' }
    end
  end

  describe '#active' do
    context "when set a value" do
      subject { BankAccount.new(active: false) }

      it { expect(subject.active).to be false }
    end

    context "when is default" do
      it { expect(subject.active).to be true }
    end
  end

  describe '#user' do
    context "respond to" do
      subject { BankAccount.new }

      it { expect(subject.respond_to? :user).to be true }
      it { expect(subject.respond_to? :user_id).to be true }
    end
  end
end
