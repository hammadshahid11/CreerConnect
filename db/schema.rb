# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_006_115_603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'company_profiles', force: :cascade do |t|
    t.string 'name'
    t.string 'contact_information'
    t.text 'bio'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_company_profiles_on_user_id'
  end

  create_table 'job_applications', force: :cascade do |t|
    t.bigint 'job_seeker_id', null: false
    t.bigint 'job_posting_id', null: false
    t.text 'cover_letter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_posting_id'], name: 'index_job_applications_on_job_posting_id'
    t.index ['job_seeker_id'], name: 'index_job_applications_on_job_seeker_id'
  end

  create_table 'job_postings', force: :cascade do |t|
    t.string 'title'
    t.string 'company_name'
    t.text 'description'
    t.string 'location'
    t.decimal 'salary'
    t.text 'qualifications'
    t.text 'application_instructions'
    t.bigint 'company_profile_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status', default: 'pending_review'
    t.index ['company_profile_id'], name: 'index_job_postings_on_company_profile_id'
  end

  create_table 'job_seekers', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.text 'bio'
    t.string 'contact'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_job_seekers_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.text 'content'
    t.bigint 'sender_id'
    t.bigint 'receiver_id'
    t.string 'messageable_type', null: false
    t.bigint 'messageable_id', null: false
    t.bigint 'job_application_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_application_id'], name: 'index_messages_on_job_application_id'
    t.index %w[messageable_type messageable_id], name: 'index_messages_on_messageable'
  end

  create_table 'saved_jobs', force: :cascade do |t|
    t.bigint 'job_seeker_id', null: false
    t.bigint 'job_posting_id', null: false
    t.datetime 'date_saved'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_posting_id'], name: 'index_saved_jobs_on_job_posting_id'
    t.index ['job_seeker_id'], name: 'index_saved_jobs_on_job_seeker_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role'
    t.boolean 'blocked'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'company_profiles', 'users'
  add_foreign_key 'job_applications', 'job_postings'
  add_foreign_key 'job_applications', 'job_seekers'
  add_foreign_key 'job_postings', 'company_profiles'
  add_foreign_key 'job_seekers', 'users'
  add_foreign_key 'messages', 'job_applications'
  add_foreign_key 'saved_jobs', 'job_postings'
  add_foreign_key 'saved_jobs', 'job_seekers'
end
