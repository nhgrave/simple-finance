require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#operations' do
    context "respond to" do
      subject { User.new }

      it { expect(subject.respond_to? :operations).to be true }
    end
  end

  describe '#bank_accounts' do
    context "respond to" do
      subject { User.new }

      it { expect(subject.respond_to? :bank_accounts).to be true }
    end
  end

  describe '#categories' do
    context "respond to" do
      subject { User.new }

      it { expect(subject.respond_to? :categories).to be true }
    end
  end
end
