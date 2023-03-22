package goshka133.football.feature_profile.screens.profile.presentation

import androidx.compose.runtime.Immutable
import goshka133.football.domain_profile.dto.Profile
import goshka133.football.domain_profile.dto.mock

@Immutable
internal data class ProfileState(
  val profile: Profile = Profile.mock(),
)

internal sealed interface ProfileEvent {

  sealed interface Ui : ProfileEvent {
    object System {
      object Start : Ui
    }

    object Click {
      // your code
    }

    object Action {
      // your code
    }
  }

  sealed interface Internal : ProfileEvent {
    // your code
  }
}

internal sealed interface ProfileCommand {
  // your code
}

@Immutable
internal sealed interface ProfileEffect {
  // your code
}
