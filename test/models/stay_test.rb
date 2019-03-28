require 'test_helper'

class StayTest < ActiveSupport::TestCase

  def setup
    stay = Stay.new(tenant: Tenant.first, studio: Studio.first, starts_at: Date.new(2017, 1, 1), ends_at: Date.new(2017, 1, 10))
    stay.save
  end

  test 'valid stay' do
    tenant = Tenant.first
    studio = Studio.first
    starts_at = Date.new(2019, 1, 2)
    ends_at = Date.new(2019, 1, 10)
    stay = Stay.new(tenant: tenant, studio: studio, starts_at: starts_at, ends_at: ends_at)
    assert stay.valid?
  end

  test 'invalid stay without studio' do
    tenant = Tenant.first
    starts_at = Date.new(2019, 1, 2)
    ends_at = Date.new(2019, 1, 10)
    stay = Stay.new(tenant: tenant, starts_at: starts_at, ends_at: ends_at)
    refute stay.valid?, 'stay is valid without a studio'
    assert_not_nil stay.errors[:name], 'no validation error for studio present'
  end

  test 'invalid stay without tenant' do
    studio = Studio.first
    starts_at = Date.new(2019, 1, 2)
    ends_at = Date.new(2019, 1, 10)
    stay = Stay.new(studio: studio, starts_at: starts_at, ends_at: ends_at)
    refute stay.valid?, 'stay is valid without a tenant'
    assert_not_nil stay.errors[:name], 'no validation error for tenant present'
  end

  test 'invalid stay without starts_at' do
    tenant = Tenant.first
    studio = Studio.first
    ends_at = Date.new(2019, 1, 10)
    stay = Stay.new(tenant: tenant, studio: studio, ends_at: ends_at)
    refute stay.valid?, 'stay is valid without starts_at'
    assert_not_nil stay.errors[:name], 'no validation error for starts_at present'
  end

  test 'invalid stay without ends_at' do
    tenant = Tenant.first
    studio = Studio.first
    starts_at = Date.new(2019, 1, 2)
    stay = Stay.new(tenant: tenant, studio: studio, starts_at: starts_at)
    refute stay.valid?, 'stay is valid without ends_at'
    assert_not_nil stay.errors[:name], 'no validation error for ends_at present'
  end

  test 'invalid stay with starts date included in an other stay' do
    tenant = Tenant.first
    studio = Studio.first
    starts_at = Date.new(2017, 1, 2)
    ends_at = Date.new(2017, 2, 1)
    stay = Stay.new(tenant: tenant, studio: studio, starts_at: starts_at, ends_at: ends_at)
    refute stay.valid?, 'stay is valid with starts date included between other stay for the same studio'
    assert_not_nil stay.errors[:name], 'no validation error when studio is not available because of start date'
  end

  test 'invalid stay with ends date included in an other stay' do
    tenant = Tenant.first
    studio = Studio.first
    starts_at = Date.new(2016, 12, 1)
    ends_at = Date.new(2017, 1, 8)
    stay = Stay.new(tenant: tenant, studio: studio, starts_at: starts_at, ends_at: ends_at)
    refute stay.valid?, 'stay is valid with ends date included between other stay for the same studio'
    assert_not_nil stay.errors[:name], 'no validation error when studio is not available because of end date'
  end

  test 'invalid stay with a period included in an other stay' do
    tenant = Tenant.first
    studio = Studio.first
    starts_at = Date.new(2016, 12, 1)
    ends_at = Date.new(2017, 1, 30)
    stay = Stay.new(tenant: tenant, studio: studio, starts_at: starts_at, ends_at: ends_at)
    refute stay.valid?, 'stay is valid with a period included in other stay for the same studio'
    assert_not_nil stay.errors[:name], 'no validation error when studio is not available because a period inside'
  end

end
