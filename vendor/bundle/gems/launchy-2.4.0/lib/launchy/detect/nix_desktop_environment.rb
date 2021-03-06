module Launchy::Detect
  #
  # Detect the current desktop environment for *nix machines
  # Currently this is Linux centric. The detection is based upon the detection
  # used by xdg-open from http://portland.freedesktop.org/
  class NixDesktopEnvironment
    class NotFoundError < Launchy::Error; end

    extend ::Launchy::DescendantTracker

    # Detect the current *nix desktop environment
    #
    # If the current dekstop environment be detected, the return
    # NixDekstopEnvironment::Unknown
    def self.detect
      found = find_child( :is_current_desktop_environment? )
      Launchy.log("Current Desktop environment not found. #{Launchy.bug_report_message}") unless found
      return found
    end

    def self.fallback_browsers
      %w[ firefox seamonkey opera mozilla netscape galeon ]
    end

    def self.browsers
      [ browser, fallback_browsers ].flatten
    end

    #---------------------------------------
    # The list of known desktop environments
    #---------------------------------------

    class Kde < NixDesktopEnvironment
      def self.is_current_desktop_environment?
        ENV['KDE_FULL_SESSION']
      end

      def self.browser
        'kfmclient'
      end
    end

    class Gnome < NixDesktopEnvironment
      def self.is_current_desktop_environment?
        ENV['GNOME_DESKTOP_SESSION_ID']
      end

      def self.browser
        'gnome-open'
      end
    end

    class Xfce < NixDesktopEnvironment
      def self.is_current_desktop_environment?
        if Launchy::Application.find_executable( 'xprop' ) then
          %x[ xprop -root _DT_SAVE_MODE].include?("xfce")
        else
          false
        end
      end

      def self.browser
        'exo-open'
      end
    end

    # Fall back environment as the last case
    class Xdg < NixDesktopEnvironment
      def self.is_current_desktop_environment?
        Launchy::Application.find_executable( browser )
      end

      def self.browser
        'xdg-open'
      end
    end

    # The one that is found when all else fails. And this must be declared last
    class NotFound < NixDesktopEnvironment
      def self.is_current_desktop_environment?
        true
      end

      def self.browser
        []
      end
    end

  end
end

