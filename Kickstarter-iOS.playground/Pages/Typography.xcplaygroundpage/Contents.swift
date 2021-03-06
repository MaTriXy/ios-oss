import Library
import PlaygroundSupport
import Prelude
import Prelude_UIKit
import UIKit

let liveView = UIView(frame: .init(x: 0, y: 0, width: 800, height: 600))
  |> UIView.lens.backgroundColor .~ .ksr_grey_100
PlaygroundPage.current.liveView = liveView

let rootStackView = UIStackView(frame: liveView.bounds)
  |> UIStackView.lens.alignment .~ .leading
  |> UIStackView.lens.axis .~ .vertical
  |> UIStackView.lens.distribution .~ .fill
  |> UIStackView.lens.isLayoutMarginsRelativeArrangement .~ true
  |> UIStackView.lens.layoutMargins .~ .init(top: 16, left: 16, bottom: 16, right: 16)
  |> UIStackView.lens.spacing .~ 8.0
liveView.addSubview(rootStackView)

let fonts: [(String, UIFont)] = [
  ("title1", .ksr_title1()),
  ("title2", .ksr_title2()),
  ("title3", .ksr_title3()),
  ("headline", .ksr_headline()),
  ("body", .ksr_body()),
  ("callout", .ksr_callout()),
  ("subhead", .ksr_subhead()),
  ("footnote", .ksr_footnote()),
  ("caption1", .ksr_caption1()),
  ("caption2", .ksr_caption2())
].sorted { lhs, rhs in lhs.1.pointSize > rhs.1.pointSize }

let base = UILabel.lens.text .~ "The quick brown fox jumps over the lazy dog"
  <> UILabel.lens.textColor .~ .ksr_text_dark_grey_500

for (name, font) in fonts {
  rootStackView.addArrangedSubview(
    UILabel()
      |> base
      |> UILabel.lens.text %~ { "\(name): \($0)" }
      |> UILabel.lens.font .~ font
  )
}

for (name, font) in fonts {
  rootStackView.addArrangedSubview(
    UILabel()
      |> base
      |> UILabel.lens.text %~ { "\(name).bold: \($0)" }
      |> UILabel.lens.font .~ font.bolded
  )
}
