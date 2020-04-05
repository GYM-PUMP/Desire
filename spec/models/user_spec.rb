require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_user.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        test_user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Commentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'likesモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'contactsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:contacts).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'followerモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:follower).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'followedモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followed).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'following_userモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:following_user).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'follower_userモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:follower_user).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'gymモデルとの関係' do
      it 'N:1となっている' do
        expect(User.reflect_on_association(:gym).macro).to eq :belongs_to
      end
    end
  end
end