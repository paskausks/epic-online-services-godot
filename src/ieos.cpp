#include "ieos.h"

using namespace godot;

#define IEOS_BIND_METHOD(m_name) ClassDB::bind_method(D_METHOD(#m_name), &IEOS::m_name)

void IEOS::_bind_methods() {
    ClassDB::bind_static_method("IEOS", D_METHOD("tick"), &IEOS::tick);
    IEOS_BIND_METHOD(shutdown);

    // EOS Methods
    IEOS_BIND_METHOD(platform_interface_create);
    IEOS_BIND_METHOD(platform_interface_get_active_country_code);
    IEOS_BIND_METHOD(platform_interface_get_active_locale_code);
    IEOS_BIND_METHOD(platform_interface_get_override_country_code);
    IEOS_BIND_METHOD(platform_interface_get_override_locale_code);
    IEOS_BIND_METHOD(platform_interface_set_override_country_code);
    IEOS_BIND_METHOD(platform_interface_set_override_locale_code);
    IEOS_BIND_METHOD(platform_interface_check_for_launcher_and_restart);
    IEOS_BIND_METHOD(platform_interface_initialize);
    IEOS_BIND_METHOD(platform_interface_get_desktop_crossplay_status);
    IEOS_BIND_METHOD(platform_interface_set_application_status);
    IEOS_BIND_METHOD(platform_interface_get_application_status);
    IEOS_BIND_METHOD(platform_interface_set_network_status);
    IEOS_BIND_METHOD(platform_interface_get_network_status);
    IEOS_BIND_METHOD(platform_interface_release);
    IEOS_BIND_METHOD(platform_interface_shutdown);
    IEOS_BIND_METHOD(logging_interface_set_log_level);
    IEOS_BIND_METHOD(version_interface_get_version);
    IEOS_BIND_METHOD(version_interface_get_constants);
    IEOS_BIND_METHOD(auth_interface_login);
    IEOS_BIND_METHOD(auth_interface_logout);
    IEOS_BIND_METHOD(auth_interface_copy_id_token);
    IEOS_BIND_METHOD(auth_interface_copy_user_auth_token);
    IEOS_BIND_METHOD(auth_interface_delete_persistent_auth);
    IEOS_BIND_METHOD(auth_interface_get_logged_in_account_by_index);
    IEOS_BIND_METHOD(auth_interface_get_logged_in_accounts_count);
    IEOS_BIND_METHOD(auth_interface_get_login_status);
    IEOS_BIND_METHOD(auth_interface_get_merged_account_by_index);
    IEOS_BIND_METHOD(auth_interface_get_merged_accounts_count);
    IEOS_BIND_METHOD(auth_interface_get_selected_account_id);
    IEOS_BIND_METHOD(auth_interface_query_id_token);
    IEOS_BIND_METHOD(auth_interface_verify_id_token);
    IEOS_BIND_METHOD(auth_interface_link_account);
    IEOS_BIND_METHOD(auth_interface_verify_user_auth);
    IEOS_BIND_METHOD(connect_interface_login);
    IEOS_BIND_METHOD(connect_interface_copy_id_token);
    IEOS_BIND_METHOD(connect_interface_copy_product_user_external_account_by_account_id);
    IEOS_BIND_METHOD(connect_interface_copy_product_user_external_account_by_account_type);
    IEOS_BIND_METHOD(connect_interface_copy_product_user_external_account_by_index);
    IEOS_BIND_METHOD(connect_interface_copy_product_user_info);
    IEOS_BIND_METHOD(connect_interface_create_device_id);
    IEOS_BIND_METHOD(connect_interface_delete_device_id);
    IEOS_BIND_METHOD(connect_interface_create_user);
    IEOS_BIND_METHOD(connect_interface_get_external_account_mapping);
    IEOS_BIND_METHOD(connect_interface_get_logged_in_user_by_index);
    IEOS_BIND_METHOD(connect_interface_get_logged_in_users_count);
    IEOS_BIND_METHOD(connect_interface_get_login_status);
    IEOS_BIND_METHOD(connect_interface_get_product_user_external_account_count);
    IEOS_BIND_METHOD(connect_interface_get_product_user_id_mapping);
    IEOS_BIND_METHOD(connect_interface_link_account);
    IEOS_BIND_METHOD(connect_interface_verify_id_token);
    IEOS_BIND_METHOD(connect_interface_transfer_device_id_account);
    IEOS_BIND_METHOD(connect_interface_unlink_account);
    IEOS_BIND_METHOD(achievements_interface_copy_achievement_definition_v2_by_achievement_id);
    IEOS_BIND_METHOD(achievements_interface_copy_achievement_definition_v2_by_index);
    IEOS_BIND_METHOD(achievements_interface_copy_player_achievement_by_achievement_id);
    IEOS_BIND_METHOD(achievements_interface_copy_player_achievement_by_index);
    IEOS_BIND_METHOD(achievements_interface_get_achievement_definition_count);
    IEOS_BIND_METHOD(achievements_interface_query_definitions);
    IEOS_BIND_METHOD(achievements_interface_get_player_achievement_count);
    IEOS_BIND_METHOD(achievements_interface_query_player_achievements);
    IEOS_BIND_METHOD(achievements_interface_unlock_achievements);
    IEOS_BIND_METHOD(custom_invites_interface_finalize_invite);
    IEOS_BIND_METHOD(custom_invites_interface_send_custom_invite);
    IEOS_BIND_METHOD(custom_invites_interface_set_custom_invite);
    IEOS_BIND_METHOD(stats_interface_copy_stat_by_index);
    IEOS_BIND_METHOD(stats_interface_copy_stat_by_name);
    IEOS_BIND_METHOD(stats_interface_get_stats_count);
    IEOS_BIND_METHOD(stats_interface_ingest_stat);
    IEOS_BIND_METHOD(stats_interface_query_stats);
    IEOS_BIND_METHOD(leaderboards_interface_copy_leaderboard_definition_by_index);
    IEOS_BIND_METHOD(leaderboards_interface_copy_leaderboard_definition_by_leaderboard_id);
    IEOS_BIND_METHOD(leaderboards_interface_copy_leaderboard_record_by_index);
    IEOS_BIND_METHOD(leaderboards_interface_copy_leaderboard_record_by_user_id);
    IEOS_BIND_METHOD(leaderboards_interface_copy_leaderboard_user_score_by_index);
    IEOS_BIND_METHOD(leaderboards_interface_copy_leaderboard_user_score_by_user_id);
    IEOS_BIND_METHOD(leaderboards_interface_get_leaderboard_definition_count);
    IEOS_BIND_METHOD(leaderboards_interface_get_leaderboard_record_count);
    IEOS_BIND_METHOD(leaderboards_interface_get_leaderboard_user_score_count);
    IEOS_BIND_METHOD(leaderboards_interface_query_leaderboard_definitions);
    IEOS_BIND_METHOD(leaderboards_interface_query_leaderboard_ranks);
    IEOS_BIND_METHOD(leaderboards_interface_query_leaderboard_user_scores);
    IEOS_BIND_METHOD(friends_interface_accept_invite);
    IEOS_BIND_METHOD(friends_interface_get_friend_at_index);
    IEOS_BIND_METHOD(friends_interface_get_friends_count);
    IEOS_BIND_METHOD(friends_interface_get_status);
    IEOS_BIND_METHOD(friends_interface_query_friends);
    IEOS_BIND_METHOD(friends_interface_reject_invite);
    IEOS_BIND_METHOD(friends_interface_send_invite);
    IEOS_BIND_METHOD(user_info_interface_copy_external_user_info_by_account_id);
    IEOS_BIND_METHOD(user_info_interface_copy_external_user_info_by_account_type);
    IEOS_BIND_METHOD(user_info_interface_copy_external_user_info_by_index);
    IEOS_BIND_METHOD(user_info_interface_copy_user_info);
    IEOS_BIND_METHOD(user_info_interface_get_external_user_info_count);
    IEOS_BIND_METHOD(user_info_interface_query_user_info);
    IEOS_BIND_METHOD(user_info_interface_query_user_info_by_display_name);
    IEOS_BIND_METHOD(user_info_interface_query_user_info_by_external_account);
    IEOS_BIND_METHOD(ecom_interface_checkout);
    IEOS_BIND_METHOD(ecom_interface_copy_entitlement_by_id);
    IEOS_BIND_METHOD(ecom_interface_copy_entitlement_by_index);
    IEOS_BIND_METHOD(ecom_interface_copy_entitlement_by_name_and_index);
    IEOS_BIND_METHOD(ecom_interface_copy_item_by_id);
    IEOS_BIND_METHOD(ecom_interface_copy_item_image_info_by_index);
    IEOS_BIND_METHOD(ecom_interface_copy_item_release_by_index);
    IEOS_BIND_METHOD(ecom_interface_copy_offer_by_id);
    IEOS_BIND_METHOD(ecom_interface_copy_offer_by_index);
    IEOS_BIND_METHOD(ecom_interface_copy_offer_image_info_by_index);
    IEOS_BIND_METHOD(ecom_interface_copy_offer_item_by_index);
    IEOS_BIND_METHOD(ecom_interface_copy_transaction_by_id);
    IEOS_BIND_METHOD(ecom_interface_copy_transaction_by_index);
    IEOS_BIND_METHOD(ecom_interface_get_entitlements_by_name_count);
    IEOS_BIND_METHOD(ecom_interface_get_entitlements_count);
    IEOS_BIND_METHOD(ecom_interface_get_item_image_info_count);
    IEOS_BIND_METHOD(ecom_interface_get_item_release_count);
    IEOS_BIND_METHOD(ecom_interface_get_offer_count);
    IEOS_BIND_METHOD(ecom_interface_get_offer_image_info_count);
    IEOS_BIND_METHOD(ecom_interface_get_offer_item_count);
    IEOS_BIND_METHOD(ecom_interface_get_transaction_count);
    IEOS_BIND_METHOD(ecom_interface_query_entitlements);
    IEOS_BIND_METHOD(ecom_interface_query_offers);
    IEOS_BIND_METHOD(ecom_interface_query_ownership);
    IEOS_BIND_METHOD(ecom_interface_query_ownership_token);
    IEOS_BIND_METHOD(ecom_interface_redeem_entitlements);
    IEOS_BIND_METHOD(ui_interface_acknowledge_event_id);
    IEOS_BIND_METHOD(ui_interface_get_friends_visible);
    IEOS_BIND_METHOD(ui_interface_get_notification_location_preference);
    IEOS_BIND_METHOD(ui_interface_get_toggle_friends_key);
    IEOS_BIND_METHOD(ui_interface_hide_friends);
    IEOS_BIND_METHOD(ui_interface_is_valid_key_combination);
    IEOS_BIND_METHOD(ui_interface_set_display_preference);
    IEOS_BIND_METHOD(ui_interface_set_toggle_friends_key);
    IEOS_BIND_METHOD(ui_interface_show_friends);
    IEOS_BIND_METHOD(kws_interface_copy_permission_by_index);
    IEOS_BIND_METHOD(kws_interface_create_user);
    IEOS_BIND_METHOD(kws_interface_get_permission_by_key);
    IEOS_BIND_METHOD(kws_interface_get_permissions_count);
    IEOS_BIND_METHOD(kws_interface_query_age_gate);
    IEOS_BIND_METHOD(kws_interface_query_permissions);
    IEOS_BIND_METHOD(kws_interface_request_permissions);
    IEOS_BIND_METHOD(kws_interface_update_parent_email);
    IEOS_BIND_METHOD(metrics_interface_begin_player_session);
    IEOS_BIND_METHOD(metrics_interface_end_player_session);
    IEOS_BIND_METHOD(mods_interface_copy_mod_info);
    IEOS_BIND_METHOD(mods_interface_enumerate_mods);
    IEOS_BIND_METHOD(reports_interface_send_player_behavior_report);
    IEOS_BIND_METHOD(progression_snapshot_interface_begin_snapshot);
    IEOS_BIND_METHOD(progression_snapshot_interface_add_progression);
    IEOS_BIND_METHOD(progression_snapshot_interface_submit_snapshot);
    IEOS_BIND_METHOD(progression_snapshot_interface_delete_snapshot);
    IEOS_BIND_METHOD(presence_interface_copy_presence);
    IEOS_BIND_METHOD(presence_interface_create_presence_modification);
    IEOS_BIND_METHOD(presence_interface_get_join_info);
    IEOS_BIND_METHOD(presence_interface_has_presence);
    IEOS_BIND_METHOD(presence_interface_query_presence);
    IEOS_BIND_METHOD(presence_interface_set_presence);

    ADD_SIGNAL(MethodInfo("logging_interface_callback", PropertyInfo(Variant::DICTIONARY, "log_message")));
    ADD_SIGNAL(MethodInfo("auth_interface_login_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_logout_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_login_status_changed", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_delete_persistent_auth_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_query_id_token_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_verify_id_token_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_verify_user_auth_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("auth_interface_link_account_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_login_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_auth_expiration", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_login_status_changed", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_create_device_id_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_delete_device_id_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_create_user_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_link_account_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_verify_id_token_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_transfer_device_id_account_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("connect_interface_unlink_account_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("achievements_interface_achievements_unlocked_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("achievements_interface_query_definitions_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("achievements_interface_query_player_achievements_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("achievements_interface_unlock_achievements_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("custom_invites_interface_custom_invite_accepted_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("custom_invites_interface_custom_invite_received_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("custom_invites_interface_send_custom_invite_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("stats_interface_ingest_stat_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("stats_interface_query_stats_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("leaderboards_interface_query_leaderboard_definitions_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("leaderboards_interface_query_leaderboard_ranks_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("leaderboards_interface_query_leaderboard_user_scores_complete_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("friends_interface_accept_invite_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("friends_interface_friends_update_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("friends_interface_query_friends_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("friends_interface_reject_invite_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("friends_interface_send_invite_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("user_info_interface_query_user_info_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("user_info_interface_query_user_info_by_display_name_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("user_info_interface_query_user_info_by_external_account_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ecom_interface_checkout_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ecom_interface_query_entitlements_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ecom_interface_query_offers_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ecom_interface_query_ownership_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ecom_interface_query_ownership_token_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ecom_interface_redeem_entitlements_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ui_interface_display_settings_updated_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ui_interface_hide_friends_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("ui_interface_show_friends_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("kws_interface_permissions_update_received", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("kws_interface_create_user_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("kws_interface_query_age_gate_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("kws_interface_query_permissions_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("kws_interface_request_permissions_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("kws_interface_update_parent_email_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("mods_interface_enumerate_mods_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("reports_interface_report_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("progression_snapshot_interface_submit_snapshot_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("progression_snapshot_interface_delete_snapshot_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("presence_interface_join_game_accepted", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("presence_interface_presence_changed", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("presence_interface_query_presence_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
    ADD_SIGNAL(MethodInfo("presence_interface_set_presence_callback", PropertyInfo(Variant::DICTIONARY, "callback_data")));
}

int IEOS::shutdown() {
    EOS_EResult result = EOS_Shutdown();
    return static_cast<int>(result);
}

IEOS *IEOS::singleton = nullptr;

IEOS *IEOS::get_singleton() { return singleton; }

IEOS::IEOS() {
    // Initialize any variables here
    ERR_FAIL_COND(singleton != nullptr);
    singleton = this;
}

IEOS::~IEOS() {
    // Add your cleanup here
    ERR_FAIL_COND(singleton != this);
    if (s_platformInterface != nullptr) {
        EOS_Platform_Release(s_platformInterface);
    }
    singleton = nullptr;
}

void IEOS::tick() {
    if (IEOS::get_singleton()->s_platformInterface != nullptr) {
        EOS_Platform_Tick(IEOS::get_singleton()->s_platformInterface);
    }
}