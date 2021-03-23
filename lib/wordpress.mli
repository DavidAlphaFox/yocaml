(** Here is the list of modules exposed by the Wordpress library. The concept
    behind this project is to offer, as a library, a set of tools to build
    pages. In other words, the end user, in this case me, would only have to
    build a new project in which Preface and Wordpress would be dependencies
    and then easily create his own static blog generator. It's likely that it
    won't be efficient or ergonomic, but it's a fun project to do in your
    spare time.

    Please refer to {{:../index.html} the documentation index} for an example. *)

(** {1 High-level API}

    The WordPress high-level API. It is mainly these combiners that should be
    used to build static pages. *)

(** Runs a Wordpress program. *)
val run : 'a Effect.t -> 'a

(** Collapses sequentially Wordpress program. [sequence p ps f] produces a
    program which performs [p] followed by [f ps]. *)
val sequence
  :  'b Effect.t
  -> 'a list Effect.t
  -> ('a -> 'b Effect.t)
  -> 'b Effect.t

(** {1 Build system}

    [Build] is the main module of {e Wordpress}. It is used to describe rules
    attached to dependencies. A static site generator is a collection of
    ordered rules. (So it is probably not useful to use this project and it
    would be better to write everything with [make], [sed] and [awk]). *)

module Build = Build

(** {2 Composants}

    Components are essential ingredients in the definition of a build
    strategy. *)

module Deps = Deps
module Generator = Generator

(** {1 Handling}

    {2 Effects Handling}

    In order to take advantage of {{:httsp://github.com/xvw/preface} Preface}
    (for fun and profit) Wordpress describes a list of effects to manage. As
    for errors, executable effects are centralised. *)

module Effect = Effect

(** {2 Errors Handling}

    Errors handling is mainly based on a biased version of [Result] and
    [Validation] offered by {{:httsp://github.com/xvw/preface} Preface}. *)

module Error = Error
module Try = Try
module Validate = Validate

(** {1 Misc}

    Modules serving only internal interests. They are documented (and public)
    only for the purpose of clarifying the documentation. *)

module Lexicon = Lexicon
module Aliases = Aliases
module Util = Util

(** {1 Included common utils}

    There are always lots of little unreadable tools that I want to use...
    sometimes it improves readability... sometimes not. *)

include module type of Util
