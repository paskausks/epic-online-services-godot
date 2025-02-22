#pragma once

#include "eos_auth.h"
#include "eos_init.h"
#include "eos_logging.h"
#include "eos_sdk.h"
#include "eos_version.h"
#include "godot_cpp/classes/object.hpp"
#include "godot_cpp/classes/project_settings.hpp"
#include "godot_cpp/classes/ref_counted.hpp"
#include "godot_cpp/core/binder_common.hpp"
#include "godot_cpp/core/class_db.hpp"
#include "godot_cpp/variant/utility_functions.hpp"
#include "utils.h"
#ifdef _WIN32
#include "Windows/eos_Windows.h"
#endif

namespace godot {

class IEOS : public RefCounted {
    GDCLASS(IEOS, RefCounted)

    static IEOS* singleton;

   protected:
    static void _bind_methods();
    EOS_HPlatform s_platformInterface = nullptr;
    EOS_HAuth s_authInterface = nullptr;

   public:
    static IEOS* get_singleton();

    IEOS();
    ~IEOS();

    static void tick();
    int shutdown();

    // -----
    // Platform Interface
    // -----
    bool platform_interface_create(Ref<RefCounted> options);
    Dictionary platform_interface_get_active_country_code(const String& user_id);
    Dictionary platform_interface_get_active_locale_code(const String& user_id);
    Dictionary platform_interface_get_override_country_code();
    Dictionary platform_interface_get_override_locale_code();
    int platform_interface_set_override_country_code(const String& country_code);
    int platform_interface_set_override_locale_code(const String& locale_code);
    int platform_interface_check_for_launcher_and_restart();
    int platform_interface_initialize(Ref<RefCounted> options);
    Dictionary platform_interface_get_desktop_crossplay_status();
    int platform_interface_set_application_status(int status);
    int platform_interface_get_application_status();
    int platform_interface_set_network_status(int status);
    int platform_interface_get_network_status();
    void platform_interface_release();
    int platform_interface_shutdown();

    // -----
    // Logging Interface
    // -----
    int logging_interface_set_log_level(int category, int level);

    // -----
    // Version Interface
    // -----
    String version_interface_get_version();
    Dictionary version_interface_get_constants();

    // -----
    // Auth interface
    // -----
    void auth_interface_login(Ref<RefCounted> options);
    void auth_interface_logout(Ref<RefCounted> options);
    Dictionary auth_interface_copy_id_token(Ref<RefCounted> options);
    Dictionary auth_interface_copy_user_auth_token(Ref<RefCounted> options, const String& local_user_id);
    void auth_interface_delete_persistent_auth(Ref<RefCounted> options);
    String auth_interface_get_logged_in_account_by_index(int index);
    int auth_interface_get_logged_in_accounts_count();
    int auth_interface_get_login_status(const String& local_user_id);
    String auth_interface_get_merged_account_by_index(const String& local_user_id, int index);
    int auth_interface_get_merged_accounts_count(const String& local_user_id);
    Dictionary auth_interface_get_selected_account_id(const String& local_user_id);
    void auth_interface_query_id_token(Ref<RefCounted> options);
    void auth_interface_verify_id_token(Ref<RefCounted> options);
    void auth_interface_link_account(Ref<RefCounted> options);
    void auth_interface_verify_user_auth(Ref<RefCounted> _options);

    // -----
    // Connect Interface
    // -----
    void connect_interface_login(Ref<RefCounted> options);
    Dictionary connect_interface_copy_id_token(Ref<RefCounted> options);
    Dictionary connect_interface_copy_product_user_external_account_by_account_id(Ref<RefCounted> options);
    Dictionary connect_interface_copy_product_user_external_account_by_account_type(Ref<RefCounted> options);
    Dictionary connect_interface_copy_product_user_external_account_by_index(Ref<RefCounted> options);
    Dictionary connect_interface_copy_product_user_info(Ref<RefCounted> options);
    void connect_interface_create_device_id(Ref<RefCounted> options);
    void connect_interface_delete_device_id(Ref<RefCounted> options);
    void connect_interface_create_user(Ref<RefCounted> options);
    String connect_interface_get_external_account_mapping(Ref<RefCounted> options);
    String connect_interface_get_logged_in_user_by_index(int index);
    int connect_interface_get_logged_in_users_count();
    int connect_interface_get_login_status(const String& local_user_id);
    int connect_interface_get_product_user_external_account_count(Ref<RefCounted> options);
    Dictionary connect_interface_get_product_user_id_mapping(Ref<RefCounted> options);
    void connect_interface_link_account(Ref<RefCounted> options);
    void connect_interface_verify_id_token(Ref<RefCounted> options);
    void connect_interface_transfer_device_id_account(Ref<RefCounted> options);
    void connect_interface_unlink_account(Ref<RefCounted> options);

    // -----
    // Achievement Interface
    // -----
    Dictionary achievements_interface_copy_achievement_definition_v2_by_achievement_id(Ref<RefCounted> p_options);
    Dictionary achievements_interface_copy_achievement_definition_v2_by_index(Ref<RefCounted> p_options);
    Dictionary achievements_interface_copy_player_achievement_by_achievement_id(Ref<RefCounted> p_options);
    Dictionary achievements_interface_copy_player_achievement_by_index(Ref<RefCounted> p_options);
    int achievements_interface_get_achievement_definition_count(Ref<RefCounted> p_options);
    void achievements_interface_query_definitions(Ref<RefCounted> p_options);
    int achievements_interface_get_player_achievement_count(Ref<RefCounted> p_options);
    void achievements_interface_query_player_achievements(Ref<RefCounted> p_options);
    void achievements_interface_unlock_achievements(Ref<RefCounted> p_options);

    // -----
    // Custom Invites Interface
    // -----
    int custom_invites_interface_finalize_invite(Ref<RefCounted> options);
    void custom_invites_interface_send_custom_invite(Ref<RefCounted> options);
    int custom_invites_interface_set_custom_invite(Ref<RefCounted> options);

    // -----
    // Stats Interface
    // -----
    Dictionary stats_interface_copy_stat_by_index(Ref<RefCounted> options);
    Dictionary stats_interface_copy_stat_by_name(Ref<RefCounted> options);
    int stats_interface_get_stats_count(Ref<RefCounted> options);
    void stats_interface_ingest_stat(Ref<RefCounted> options);
    void stats_interface_query_stats(Ref<RefCounted> options);

    // -----
    // Leaderboards Interface
    // -----
    Dictionary leaderboards_interface_copy_leaderboard_definition_by_index(Ref<RefCounted> options);
    Dictionary leaderboards_interface_copy_leaderboard_definition_by_leaderboard_id(Ref<RefCounted> options);
    Dictionary leaderboards_interface_copy_leaderboard_record_by_index(Ref<RefCounted> options);
    Dictionary leaderboards_interface_copy_leaderboard_record_by_user_id(Ref<RefCounted> options);
    Dictionary leaderboards_interface_copy_leaderboard_user_score_by_index(Ref<RefCounted> options);
    Dictionary leaderboards_interface_copy_leaderboard_user_score_by_user_id(Ref<RefCounted> options);
    int leaderboards_interface_get_leaderboard_definition_count(Ref<RefCounted> options);
    int leaderboards_interface_get_leaderboard_record_count(Ref<RefCounted> options);
    int leaderboards_interface_get_leaderboard_user_score_count(Ref<RefCounted> options);
    void leaderboards_interface_query_leaderboard_definitions(Ref<RefCounted> options);
    void leaderboards_interface_query_leaderboard_ranks(Ref<RefCounted> options);
    void leaderboards_interface_query_leaderboard_user_scores(Ref<RefCounted> options);

    // -----
    // Friends Interface
    // -----
    void friends_interface_accept_invite(Ref<RefCounted> options);
    String friends_interface_get_friend_at_index(Ref<RefCounted> options);
    int friends_interface_get_friends_count(Ref<RefCounted> options);
    int friends_interface_get_status(Ref<RefCounted> options);
    void friends_interface_query_friends(Ref<RefCounted> options);
    void friends_interface_reject_invite(Ref<RefCounted> options);
    void friends_interface_send_invite(Ref<RefCounted> options);

    // -----
    // Userinfo Interface
    // -----
    Dictionary user_info_interface_copy_external_user_info_by_account_id(Ref<RefCounted> options);
    Dictionary user_info_interface_copy_external_user_info_by_account_type(Ref<RefCounted> options);
    Dictionary user_info_interface_copy_external_user_info_by_index(Ref<RefCounted> options);
    Dictionary user_info_interface_copy_user_info(Ref<RefCounted> options);
    int user_info_interface_get_external_user_info_count(Ref<RefCounted> options);
    void user_info_interface_query_user_info(Ref<RefCounted> options);
    void user_info_interface_query_user_info_by_display_name(Ref<RefCounted> options);
    void user_info_interface_query_user_info_by_external_account(Ref<RefCounted> options);

    // -----
    // Ecom Interface
    // -----
    void ecom_interface_checkout(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_entitlement_by_id(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_entitlement_by_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_entitlement_by_name_and_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_item_by_id(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_item_image_info_by_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_item_release_by_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_offer_by_id(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_offer_by_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_offer_image_info_by_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_offer_item_by_index(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_transaction_by_id(Ref<RefCounted> options);
    Dictionary ecom_interface_copy_transaction_by_index(Ref<RefCounted> options);
    int ecom_interface_get_entitlements_by_name_count(Ref<RefCounted> options);
    int ecom_interface_get_entitlements_count(Ref<RefCounted> options);
    int ecom_interface_get_item_image_info_count(Ref<RefCounted> options);
    int ecom_interface_get_item_release_count(Ref<RefCounted> options);
    int ecom_interface_get_offer_count(Ref<RefCounted> options);
    int ecom_interface_get_offer_image_info_count(Ref<RefCounted> options);
    int ecom_interface_get_offer_item_count(Ref<RefCounted> options);
    int ecom_interface_get_transaction_count(Ref<RefCounted> options);
    void ecom_interface_query_entitlements(Ref<RefCounted> options);
    void ecom_interface_query_offers(Ref<RefCounted> options);
    void ecom_interface_query_ownership(Ref<RefCounted> options);
    void ecom_interface_query_ownership_token(Ref<RefCounted> options);
    void ecom_interface_redeem_entitlements(Ref<RefCounted> options);

    // -----
    // UI Interface
    // -----
    int ui_interface_acknowledge_event_id(Ref<RefCounted> options);
    bool ui_interface_get_friends_visible(Ref<RefCounted> options);
    int ui_interface_get_notification_location_preference();
    int ui_interface_get_toggle_friends_key(Ref<RefCounted> options);
    void ui_interface_hide_friends(Ref<RefCounted> options);
    bool ui_interface_is_valid_key_combination(int key_combination);
    int ui_interface_set_display_preference(Ref<RefCounted> options);
    int ui_interface_set_toggle_friends_key(Ref<RefCounted> options);
    void ui_interface_show_friends(Ref<RefCounted> options);

    // -----
    // KWS Interface
    // -----
    Dictionary kws_interface_copy_permission_by_index(Ref<RefCounted> options);
    void kws_interface_create_user(Ref<RefCounted> options);
    Dictionary kws_interface_get_permission_by_key(Ref<RefCounted> options);
    int kws_interface_get_permissions_count(Ref<RefCounted> options);
    void kws_interface_query_age_gate(Ref<RefCounted> options);
    void kws_interface_query_permissions(Ref<RefCounted> options);
    void kws_interface_request_permissions(Ref<RefCounted> options);
    void kws_interface_update_parent_email(Ref<RefCounted> options);

    // -----
    // Metrics Interface
    // -----
    int metrics_interface_begin_player_session(Ref<RefCounted> options);
    int metrics_interface_end_player_session(Ref<RefCounted> options);

    // -----
    // Mods Interface
    // -----
    Dictionary mods_interface_copy_mod_info(Ref<RefCounted> options);
    void mods_interface_enumerate_mods(Ref<RefCounted> options);

    // -----
    // Reports Interface
    // -----
    void reports_interface_send_player_behavior_report(Ref<RefCounted> options);

    // -----
    // Progression Snapshot Interface
    // -----
    Dictionary progression_snapshot_interface_begin_snapshot(Ref<RefCounted> options);
    int progression_snapshot_interface_add_progression(Ref<RefCounted> options);
    void progression_snapshot_interface_submit_snapshot(Ref<RefCounted> options);
    void progression_snapshot_interface_delete_snapshot(Ref<RefCounted> options);

    // -----
    // Presence Interface
    // -----
    Dictionary presence_interface_copy_presence(Ref<RefCounted> options);
    Dictionary presence_interface_create_presence_modification(Ref<RefCounted> options);
    Dictionary presence_interface_get_join_info(Ref<RefCounted> options);
    bool presence_interface_has_presence(Ref<RefCounted> options);
    void presence_interface_query_presence(Ref<RefCounted> options);
    void presence_interface_set_presence(Ref<RefCounted> options);
};

}  // namespace godot
