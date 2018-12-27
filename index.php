<html>
   <head>
      <title>Connecting MySQL Server</title>
   </head>
   <body>
      <?php
         $DB_HOST = 'localhost';
         $DB_USER = 'root';
         $DB_PASS = '123';
         $DB_OLD = 'old_joyride';
         $DB_NEW = 'new_joyride';
         $ORGANISATION_ID = 1;

         $TABLE_APP_USERS = 'app_users';
         $TABLE_USERS = 'users';
         $TABLE_USER_FLEET_MAP = 'user_fleet_map';
         $TABLE_BILLING_ACCOUNTS = 'billing_accounts';
         $TABLE_FLEETS = 'fleets';
         $TABLE_BIKES = 'bikes';
         $TABLE_VEHICLES = 'vehicles';
         $TABLE_BIKE_CURRENT_STATE = 'bike_current_state';
         $TABLE_VEHICLE_STATUS = 'vehicle_status';
         $TABLE_RIDES = 'rides';
         $TABLE_JOURNEYS = 'journeys';
         $TABLE_BILLING_PROMO_PLANS = 'billing_promo_plans';
         $TABLE_PROMOS = 'promos';
         $TABLE_FLEET_PROMO = 'fleet_promo';
         $TABLE_BILLING_PLANS = 'billing_plans';
         $TABLE_FLEET_VEHICLE_MAP = 'fleet_vehicle_map';
         $TABLE_MAP_MARKERS = 'map_markers';
         $TABLE_PAYMENTS_RECEIVED = 'payments_received';
         $TABLE_PAYMENTS_SENT = 'payments_sent';
         $TABLE_BILLING_EXTERNAL_PAYMENTS = 'billing_external_payments';
         $TABLE_BILLING_INTERNAL_PAYMENTS = 'billing_internal_payments';

         $connDbOld = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_OLD);
         $connDbNew = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NEW);

         if(!$connDbOld || !$connDbNew) {
            die('Could not connect');
         }

         function getUserBillingAccount($userId) {
           $result = mysqli_query($GLOBALS['connDbOld'], "SELECT balance, required_deposit_amount FROM $GLOBALS[TABLE_BILLING_ACCOUNTS] WHERE user_id = '$userId' LIMIT 1");
           return mysqli_fetch_array($result, MYSQLI_NUM);
         }

         function getBike($imei) {
           $result = mysqli_query($GLOBALS['connDbOld'], "SELECT id FROM $GLOBALS[TABLE_BIKES] WHERE imei = '$imei' LIMIT 1");
           return mysqli_fetch_array($result, MYSQLI_NUM);
         }

         function check($id, $table, $field = 'id') {
           $result = mysqli_query($GLOBALS['connDbNew'], "SELECT $field FROM $table WHERE $field = '$id' LIMIT 1");
           return mysqli_num_rows($result);
         }

         #### users table
         $start = 25000;
         $limit = 5000;
         $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_USERS LIMIT $start, $limit");
         
         while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
           $id = $row['id'];
           $userBillingAccount = getUserBillingAccount($id);
           $balance = $userBillingAccount[0];
           $deposit = $userBillingAccount[1];
           $state = $row['joyride_subscription_status'] == 'deleted' ? 1 : 0;
           $first_name = $row['name'];
           $last_name = $row['surname'];
           $country_code = $row['phone_country_code'];
           $phone_number = $row['phone'];
           $email = $row['email'];
           $type = $row['user_type'];
           $created_at = $row['updated_at'];
           $timestamps = $row['user_last_seen'];
           $organisation_id = $ORGANISATION_ID;
           $username = $row['username'];
           $gender = $row['gender'];
           $notes = $row['notes'];
           $device_id = $row['device_id'];
           $fcm_id = $row['fcm_id'];
           $device_token = $row['device_token'];
           $app_version = $row['app_version'];
           $os_version = $row['os_version'];
           $platform = $row['platform'];
           $distance = json_decode($row['user_settings'])->distanceUnit;
           $language_id = 1;
         
           if(check($id, $TABLE_APP_USERS)) {
             $query = "UPDATE $TABLE_APP_USERS SET id = '$id',  first_name = '$first_name', last_name = '$last_name', country_code = '$country_code', phone_number = '$phone_number', email = '$email', password = '$phone_number', type = '$type', created_at = '$created_at', `timestamp` = '$timestamps', organisation_id = '$organisation_id', username = '$username', balance = '$balance', deposite = '$deposit', state = '$state', gender = '$gender', notes = '$notes', device_id = '$device_id', fcm_id = '$fcm_id', device_token = '$device_token', app_version = '$app_version', os_version = '$os_version', platform = '$platform', distance = '$distance', language_id = '$language_id' WHERE id = '$id' LIMIT 1";
           } else {
             $query = "INSERT INTO $TABLE_APP_USERS VALUES($id, '$first_name', '$last_name', '$country_code', '$phone_number', '$email', '$phone_number', '$type', '$created_at', '$timestamps', '$organisation_id', '$username', '$balance', '$deposit', '$state', '$gender', '$notes', '$device_id', '$fcm_id', '$device_token', '$app_version', '$os_version', '$platform', '$distance', '$language_id')";
           }
           if(check($id, $TABLE_USER_FLEET_MAP, "user_id")) {
             $query2 = "UPDATE $TABLE_USER_FLEET_MAP SET user_id = '$id', fleet_id = 1 WHERE user_id = '$id' LIMIT 1";
           } else {
             $query2 = "INSERT INTO $TABLE_USER_FLEET_MAP (user_id, fleet_id) VALUES($id, 1)";
           }
         
           mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
           mysqli_query($connDbNew, $query2) or die(mysqli_error($connDbNew));
         }


         #### fleets table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_FLEETS");
         //
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $name = $row['fleet_name'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $country_id = $row['country_id'];
         //   $billing_plan_id = $row['default_billing_plan_id'];
         //   $latitude = $row['fleet_hub_latitude'];
         //   $longitude = $row['fleet_hub_longitude'];
         //   $vehicle_reservation_duration = $row['bike_reservation_minutes'];
         //   $support_email = $row['support_email'];
         //   $alert_email = $row['alert_email'];
         //   $is_private = $row['is_private_fleet'];
         //   $state = 0;
         //   $created_at = $row['updated_at'];
         //
         //   if(check($id, $TABLE_FLEETS)) {
         //     $query = "UPDATE $TABLE_FLEETS SET id = '$id', name = '$name', organisation_id  = '$organisation_id', country_id = '$country_id',  billing_plan_id = '$billing_plan_id',  latitude = '$latitude', longitude = '$longitude',  vehicle_reservation_duration = '$vehicle_reservation_duration',  support_email = '$support_email',  alert_email = '$alert_email',  is_private = '$is_private', state = '$state', created_at  = '$created_at',  timestamp = '$created_at' WHERE id = '$id' LIMIT 1";
         //   } else {
         //     $query = "INSERT INTO $TABLE_FLEETS VALUES($id, '$name', $organisation_id, $country_id, $billing_plan_id, '$latitude', '$longitude', '$vehicle_reservation_duration', '$support_email', '$alert_email', $is_private, $state, $created_at, $created_at)";
         //   }
         //
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         // }

         #### vehicles table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_BIKES");
         
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $fleet_id = $row['fleet_id'];
         //   $name = $row['bike_name'];
         //   $imei = $row['imei'];
         //   $gps_imei = $row['gps_imei'];
         //   $qr_code = $row['qr_code'];
         //   $key_code = $row['factory_qr_code'];
         //   $claim_code = $row['claim_code'];
         //   $state = 0;
         //   $mac_address = $row['ble_id'];
         //   $type = $row['message_type'];
         //   $notes = $row['notes'];
         //   $sim_phone_number = $row['sim_phone_number'];
         //   $created_at = $row['entry_date'];
         //   $updated_at = $row['updated_at'];
         //   if (check($id, $TABLE_VEHICLES)) {
         //     $query = "UPDATE $TABLE_VEHICLES SET id = '$id', organisation_id = '$organisation_id', name= '$name',  imei = '$imei', gps_imei = '$gps_imei', qr_code  = '$qr_code', key_code = '$key_code', claim_code = '$claim_code', state = '$state', mac_address = '$mac_address', type = '$type', notes = '$notes', sim_phone_number = '$sim_phone_number', created_at = '$created_at', `timestamp` = '$updated_at' WHERE id= $id LIMIT 1" ;
         //   } else {
         //     $query = "INSERT INTO $TABLE_VEHICLES VALUES($id, '$name', '$imei', '$gps_imei', '$qr_code', '$key_code', '$claim_code', '$state', '$mac_address', '$type', '$notes', '$sim_phone_number', '$created_at', '$updated_at', $organisation_id )";
         //   }
         //  if (check($id, $TABLE_FLEET_VEHICLE_MAP, "fleet_id")) {
         //    $query2 = "UPDATE $TABLE_FLEET_VEHICLE_MAP SET fleet_id = '$fleet_id', vehicle_id = '$id' WHERE vehicle_id = '$id' LIMIT 1";
         //  } else {
         //    $query2 = "INSERT INTO $TABLE_USER_FLEET_MAP (user_id, fleet_id) VALUES($id, 1)";
         //  }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         //   mysqli_query($connDbNew, $query2) or die(mysqli_error($connDbNew));
         // }

         #### vehicles status table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_BIKE_CURRENT_STATE");
         
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $bike = getBike($row['imei']);
         
         //   $id = $row['id'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $vehicle_id = $bike[0];
         //   $latitude = $row['latitude'];
         //   $longitude = $row['longitude'];
         //   $location_timestamp = $row['location_timestamp'];
         //   $status = $row['is_locked'];
         //   $status_timestamp = $row['is_locked_timestamp'];
         //   $server_timestamp = $row['socket_timestamp'];
         //   $flag_missing = $row['flag_missing'];
         //   $flag_maintenance = $row['flag_maintenance'];
         //   $flag_vehicle_fault = $row['flag_bike_fault'];
         //   $flag_lock_fault = $row['flag_lock_fault'];
         //   $flag_battery_critical = $row['flag_battery_critical'];
         //   $flag_unavailable = $row['flag_unavailable'];
         //   $flag_unlock_fails = $row['flag_unlock_fails'];
         //   $flag_stagnant = $row['flag_stagnant'];
         //   $is_ride_parked = $row['is_ride_parked'];
         //   $vehicle_battery = $row['onboard_bat_v'];
         //   $gps_battery = $row['gps_battery_voltage'];
         //   $reservation_start_timestamp = $row['reservation_start_time'];
         //   $reservation_end_timestamp = $row['reservation_expires'];
         //   $reservation_user_id = $row['reservation_user_id'];
         //   if (check($id, $TABLE_VEHICLE_STATUS)) {
         //     $query = "UPDATE $TABLE_VEHICLE_STATUS SET id = '$id', vehicle_id = '$vehicle_id', organisation_id = '$organisation_id', latitude  = '$latitude', longitude  = '$longitude', location_timestamp  = '$location_timestamp', status = '$status', status_timestamp = '$status_timestamp', server_timestamp = '$server_timestamp', flag_missing = '$flag_missing', flag_maintenance = '$flag_maintenance', flag_vehicle_fault = '$flag_vehicle_fault', flag_lock_fault  = '$flag_lock_fault', flag_battery_critical = '$flag_battery_critical', flag_unavailable  = '$flag_unavailable', flag_unlock_fails  = '$flag_unlock_fails', flag_stagnant = '$flag_stagnant', is_ride_parked  = '$is_ride_parked', vehicle_battery  = '$vehicle_battery', gps_battery = '$gps_battery', reservation_start_timestamp = '$reservation_start_timestamp', reservation_end_timestamp = '$reservation_end_timestamp', reservation_user_id = '$reservation_user_id' WHERE id = $id LIMIT 1 ";
         //   } else {
         //    $query = "INSERT INTO $TABLE_VEHICLE_STATUS VALUES($id, '$vehicle_id', '$organisation_id', '$latitude', '$longitude', '$location_timestamp', '$status', '$status_timestamp', '$server_timestamp', '$flag_missing', '$flag_maintenance', '$flag_vehicle_fault', '$flag_lock_fault', '$flag_battery_critical', '$flag_unavailable', '$flag_unlock_fails', '$flag_stagnant', '$is_ride_parked', '$vehicle_battery', '$gps_battery', '$reservation_start_timestamp', '$reservation_end_timestamp', '$reservation_user_id')";
         //   }
         //     mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         //   }

         #### rides table
         // $start = 39000;
         // $limit = 5000;
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_JOURNEYS LIMIT $start, $limit");
         
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $bike = getBike($row['bike_id']);
         
         //   $id = $row['id'];
         //   $vehicle_id = $bike[0];
         //   $user_id = $row['user'];
         //   $start_timestamp = $row['start_timestamp'];
         //   $end_timestamp = $row['end_timestamp'];
         //   $status = $row['ride_status'];
         //   $start_latitude = $row['start_latitude'];
         //   $start_longitude = $row['start_longitude'];
         //   $end_latitude = $row['end_latitude'];
         //   $end_longitude = $row['end_longitude'];
         //   $app_timestamp = $row['unlocked_time_mob'];
         //   $server_timestamp = $row['unlocked_time_svr'];
         //   $vehicle_timestamp = $row['unlocked_time_svr'];
         //   $avg_speed = $row['journey_av_speed'];
         //   $distance = $row['journey_distance'];
         //   $calories = $row['journey_calories'];
         //   $rating = $row['user_ride_rating'];
         //   $duration = $row['journey_time'];
         //   $organisation_id = $ORGANISATION_ID;
         //   if (check($id, $TABLE_RIDES)) {
         //   $query = "UPDATE $TABLE_RIDES SET id = '$id', vehicle_id = '$vehicle_id', user_id = '$user_id', start_timestamp = '$start_timestamp', end_timestamp = '$end_timestamp', status = '$status', start_latitude = '$start_latitude', start_longitude = '$start_longitude', end_latitude = '$end_latitude', end_longitude = '$end_longitude', app_timestamp = '$app_timestamp', server_timestamp = '$server_timestamp', vehicle_timestamp = '$vehicle_timestamp', avg_speed = '$avg_speed', distance = '$distance', calories = '$calories', rating = '$rating', duration = '$duration', organisation_id = '$organisation_id' WHERE id = '$id' LIMIT 1";
         //   } else {
         //   $query = "INSERT INTO $TABLE_RIDES VALUES($id, '$vehicle_id', '$user_id', '$start_timestamp', '$end_timestamp', '$status', '$start_latitude', '$start_longitude', '$end_latitude', '$end_longitude', '$app_timestamp', '$server_timestamp', '$vehicle_timestamp', '$avg_speed', '$distance', '$calories', '$rating', '$duration', '$organisation_id')";
         //   }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         // }

         #### promos table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_BILLING_PROMO_PLANS");
         //
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $type = $row['type'];
         //   $name = $row['name'];
         //   $description = $row['description'];
         //   $max_use = $row['max_single_use'];
         //   $max_daily_use = $row['max_daily_use'];
         //   $promo_code = $row['promo_code'];
         //   $status = $row['promo_state'];
         //   $start_timestamp = $row['promo_available_from'];
         //   $end_timestamp = $row['promo_available_until'];
         //   $timestamps = $row['creation_time'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $state = 0;
         //   $promo_price = $row['promo_price'];
         //   $query_string = $row['query_string'];
         //   $total_use = 0;
         //   $fleet_id = $row['fleet_id'];
         //   if (check($id, $TABLE_PROMOS)) {
         //     $query = "UPDATE $TABLE_PROMOS SET id = '$id', type = '$type', name = '$name', description = '$description', max_use = '$max_use', max_daily_use = '$max_daily_use', promo_code = '$promo_code', status = '$status', start_timestamp = '$start_timestamp', end_timestamp = '$end_timestamp', `timestamp` = '$timestamps', organisation_id = '$organisation_id', state = '$state', promo_price = '$promo_price', query_string = '$query_string', total_use = '$total_use' WHERE id = '$id' LIMIT 1";
         //   } else {
         //     $query = "INSERT INTO $TABLE_PROMOS VALUES($id, '$type', '$name', '$description', '$max_use', '$max_daily_use', '$promo_code', '$status', '$start_timestamp', '$end_timestamp', '$timestamps', '$organisation_id', '$state', '$promo_price', '$query_string', '$total_use')";
         //   }
         //   if (check($id, $TABLE_FLEET_PROMO, "fleet_id")) {
         //     $query2 = "UPDATE $TABLE_FLEET_PROMO SET fleet_id = '$fleet_id', promo_id = '$id' WHERE promo_id = '$id' LIMIT 1";
         //   } else {
         //     $query2 = "INSERT INTO $TABLE_FLEET_PROMO VALUES('$fleet_id', '$id')";
         //   }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         //   mysqli_query($connDbNew, $query2) or die(mysqli_error($connDbNew));
         // }

         #### billing table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_BILLING_PLANS");
         //
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $name = $row['plan_name'];
         //   $description = $row['plan_description'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $required_deposit_amount = $row['required_deposit_amount'];
         //   $first_billing_unit_free = $row['first_billing_unit_fee'];
         //   $next_billing_unit_free = $row['billing_unit_fee'];
         //   $tax_inclusive = $row['tax_inclusive'];
         //   $start_timestamp = $row['plan_available_from'];
         //   $end_timestamp = $row['plan_available_until'];
         //   $status = $row['plan_state'];
         //   $state = 0;
         //   if (check($id, $TABLE_BILLING_PLANS)) {
         //     $query = "UPDATE $TABLE_BILLING_PLANS SET id = $id, name = '$name', description = '$description', organisation_id = '$organisation_id', required_deposit_amount = '$required_deposit_amount', first_billing_unit_free = '$first_billing_unit_free', next_billing_unit_free = '$next_billing_unit_free', tax_inclusive = '$tax_inclusive', start_timestamp = '$start_timestamp', end_timestamp = '$end_timestamp', status = '$status', state = '$state' WHERE id = '$id' LIMIT 1";
         //   } else {
         //     $query = "INSERT INTO $TABLE_BILLING_PLANS VALUES($id, '$name', '$description', '$organisation_id', '$required_deposit_amount', '$first_billing_unit_free', '$next_billing_unit_free', '$tax_inclusive', '$start_timestamp', '$end_timestamp', '$status', '$state')";
         //   }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         // }

         #### parking table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_MAP_MARKERS");
         //
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $name = $row['label'];
         //   $type = $row['marker_type'];
         //   $fleet_id = $row['fleet_id'];
         //   $latitude = $row['latitude'];
         //   $longitude = $row['longitude'];
         //   $description = $row['description'];
         //   $zone_accuracy_radius = $row['zone_accuracy_radius'];
         //   $timestamp = $row['modified_by_user_time'];
         //   $state = 0;
         //   $created_at = $row['modified_by_user_time'];
         //   $organisation_id = $ORGANISATION_ID;
         //
         //   if (check($id, $TABLE_MAP_MARKERS)) {
         //     $query = "UPDATE $TABLE_MAP_MARKERS SET id = '$id', name = '$name', type = '$type', fleet_id = '$fleet_id', latitude = '$latitude', longitude = '$longitude', description = '$description', zone_accuracy_radius = '$zone_accuracy_radius', `timestamp` = '$timestamp', state = '$state', created_at = '$created_at', organisation_id = '$organisation_id' WHERE id = '$id' LIMIT 1";
         //   } else {
         //     $query = "INSERT INTO $TABLE_MAP_MARKERS VALUES($id, '$name', '$type', '$fleet_id', '$latitude', '$longitude', '$description', '$zone_accuracy_radius', '$timestamp', '$state', '$created_at', '$organisation_id')";
         //   }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         // }

         #### payments_received table
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_BILLING_EXTERNAL_PAYMENTS");
         
         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $user_id = $row['user_id'];
         //   $type = $row['type'];
         //   $amount = $row['amount'];
         //   $transaction_code = $row['reference_1'];
         //   $status = $row['status'];
         //   $transaction_timestamp = $row['reference_1_time'];
         //   $timestamp = $row['timestamp'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $updated_by = 1;
         //   $is_refunded = $row['reference_5'] == 'refund_successful' ? 1 : 0;
         //   $refunded_amount = $amount;
         //   $refunded_date = $row['reference_5_time'];
         
         //   if (check($id, $TABLE_PAYMENTS_RECEIVED)) {
         //     $query = "UPDATE $TABLE_PAYMENTS_RECEIVED SET id = '$id', user_id = '$user_id', type = '$type', amount = '$amount', transaction_code = '$transaction_code', status = '$status', transaction_timestamp = '$transaction_timestamp', `timestamp` = '$timestamp', organisation_id = '$organisation_id', updated_by = '$updated_by', is_refunded = '$is_refunded', refunded_amount = '$refunded_amount', refunded_date = '$refunded_date' WHERE id = '$id' LIMIT 1";
         //   } else {
         //     $query = "INSERT INTO $TABLE_PAYMENTS_RECEIVED VALUES($id, '$user_id', '$type', '$amount', '$transaction_code', '$status', '$transaction_timestamp', '$timestamp', '$organisation_id', '$updated_by', '$is_refunded', '$refunded_amount', '$refunded_date')";
         //   }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         // }


         #### payments_sent table
         // $start = 20000;
         // $limit = 5000;
         // $result = mysqli_query($connDbOld, "SELECT * FROM $TABLE_BILLING_INTERNAL_PAYMENTS LIMIT $start, $limit");

         // while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
         //   $id = $row['id'];
         //   $user_id = $row['user_id'];
         //   $bill_type = $row['type'];
         //   $promo_id = $row['user_billing_promo_id'];
         //   $amount = $row['amount'];
         //   $ride_id = $row['journey_id'];
         //   $timestamp = $row['timestamp'];
         //   $organisation_id = $ORGANISATION_ID;
         //   $is_refunded = 0;

         //   if (check($id, $TABLE_PAYMENTS_SENT)) {
         //     $query = "UPDATE $TABLE_PAYMENTS_SENT SET id = '$id', user_id = '$user_id', bill_type = '$bill_type', promo_id = '$promo_id', amount = '$amount', ride_id = '$ride_id', `timestamp` = '$timestamp', organisation_id = '$organisation_id', is_refunded = '$is_refunded' WHERE id = '$id' LIMIT 1";
         //   } else {
         //     $query = "INSERT INTO $TABLE_PAYMENTS_SENT VALUES($id, '$user_id', '$bill_type', '$promo_id', '$amount', '$ride_id', '$timestamp', '$organisation_id', '$is_refunded')";
         //   }
         //   mysqli_query($connDbNew, $query) or die(mysqli_error($connDbNew));
         // }

         mysqli_close($connDbOld);
         mysqli_close($connDbNew);
      ?>
   </body>
</html>
