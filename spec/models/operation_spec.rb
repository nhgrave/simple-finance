require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe '#description' do
    context "when set a value" do
      subject { Operation.new(description: 'Bill' ) }

      it { expect(subject.description).to eq 'Bill' }
    end

    context "when is default" do
      it { expect(subject.description).to eq '' }
    end
  end

  describe '#flow_in' do
    context "when set a value" do
      subject { Operation.new(flow_in: false) }

      it { expect(subject.flow_in).to be false }
    end

    context "when is default" do
      it { expect(subject.flow_in).to be true }
    end
  end

  describe '#paid' do
    context "when set a value" do
      subject { Operation.new(paid: true) }

      it { expect(subject.paid).to be true }
    end

    context "when is default" do
      it { expect(subject.paid).to be false }
    end
  end

  describe '#issue_at' do
    context "when set a value" do
      subject { Operation.new(issue_at: Time.parse("2022-03-25 03:45:28 UTC")) }

      it { expect(subject.issue_at.to_s).to eq "2022-03-25 03:45:28 UTC" }
    end

    context "when is default" do
      it { expect(subject.issue_at).to be nil }
    end
  end

  describe '#due_at' do
    context "when set a value" do
      subject { Operation.new(due_at: Time.parse("2022-03-25 03:45:28 UTC")) }

      it { expect(subject.due_at.to_s).to eq "2022-03-25 03:45:28 UTC" }
    end

    context "when is default" do
      it { expect(subject.due_at).to be nil }
    end
  end

  describe '#paid_at' do
    context "when set a value" do
      subject { Operation.new(paid_at: Time.parse("2022-03-25 03:45:28 UTC")) }

      it { expect(subject.paid_at.to_s).to eq "2022-03-25 03:45:28 UTC" }
    end

    context "when is default" do
      it { expect(subject.paid_at).to be nil }
    end
  end

  describe '#amount' do
    context "when set a value" do
      subject { Operation.new(amount: 337.22) }

      it { expect(subject.amount).to eq 337.22 }
    end

    context "when is default" do
      it { expect(subject.amount).to eq 0 }
    end
  end

  describe '#total' do
    context "when set a value and flow_in" do
      subject { Operation.new(flow_in: true, amount: 337.22) }

      it { expect(subject.total).to eq 337.22 }
    end

    context "when set a value and flow_out" do
      subject { Operation.new(flow_in: false, amount: 337.22) }

      it { expect(subject.total).to eq -337.22 }
    end

    context "when is default" do
      it { expect(subject.amount).to eq 0 }
    end
  end

  describe '#bank_account' do
    context "respond to" do
      subject { Operation.new }

      it { expect(subject.respond_to? :bank_account).to be true }
      it { expect(subject.respond_to? :bank_account_id).to be true }
    end
  end

  describe '#category' do
    context "respond to" do
      subject { Operation.new }

      it { expect(subject.respond_to? :category).to be true }
      it { expect(subject.respond_to? :category_id).to be true }
    end
  end

  describe '#user' do
    context "respond to" do
      subject { Operation.new }

      it { expect(subject.respond_to? :user).to be true }
      it { expect(subject.respond_to? :user_id).to be true }
    end
  end
end
