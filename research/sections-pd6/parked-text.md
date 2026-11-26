# Parked text (not compiled into the paper)

Passages taken out of `epc-pd-6.tex` that may come back later. Each entry
records where the text was, why it was removed, where its numbers come
from, and what to check before reusing it.

---

## 1. Register transition rates as an external check on the decay rate

- **Removed:** 13 October 2026, by Swapnil, from Section 2, Fact 2
  (`02-data.tex`, `\subsubsection{Fact 2: efficiency status changes in both
  directions.}`), the paragraph after Table `tab:epc-transitions` that begins
  "Two features of the register limit what these rates measure."
- **Reason:** kept out of the empirical section for now. It brings a model
  estimate into the data section, and the comparison is weaker than the
  sentence suggests (see the checks below). Candidate homes: Section 4
  (estimation, validation of untargeted moments) or Section 5 (model fit).

### Text as removed

```latex
We
therefore do not target them in estimation and use them instead as an
external check. The estimated annual decay of the efficient state in the
model, $1-\varrho = 0.16$ (Section~\ref{sec:estimation}), is close to the
downgrade rate of 15.2 percent for older homes. The appendix reports the
comparison between the first and latest certificate of each home and the
full matrix of band transitions (Figures~\ref{fig:epc-first-last}
and~\ref{fig:epc-transition-matrix}).
```

(The last sentence, pointing to the appendix figures, was kept in the paper
in Swapnil's own wording.)

### Sources of the numbers

| Number | Value | Source |
|---|---|---|
| Downgrade rate, homes built by 1990 (A–C to D–G per year) | 0.1515 (171,041 pairs) | `replication/output/tables/tab-epc-transitions.csv`, row "Built by 1990" |
| Upgrade rate, homes built by 1990 (D–G to A–C per year) | 0.0694 (1,295,552 pairs) | same file |
| Estimated `varrho` (R0) | 0.8384, s.e. 0.1512, bounds [0.80, 0.99] | `replication/output/tables/tab-estimates.csv`, row `varrho` |
| Implied decay `1 - varrho` | 0.162 | computed from the row above |

### Checks before reusing

1. **Precision.** The standard error on `varrho` is 0.15, so a 95 percent
   interval for `1 - varrho` covers almost any decay rate from 0 to above 0.4.
   "Close to 15.2 percent" is a coincidence of point estimates, not a test.
   Say so, or report the interval.
2. **Boundary.** The estimate 0.838 is near the lower bound of 0.80. The
   behaviour of the model near the bounds (0.80 and 0.99) is not
   well understood, so do not lean on the point value.
3. **Not the same object.** In the model, `1 - varrho` is the annual
   probability that any efficient home becomes inefficient. The register
   rate is measured only on homes that are re-certified (mostly at sales and
   lettings), and a band change can reflect a different assessor, a change in
   the SAP method, or measurement error, not only physical deterioration.
   Certificates lodged at a sale may also be rated favourably, which raises
   later downgrade rates (the pending sale-split paragraph in Fact 2 reports
   49 percent a year after a purchase against 21 percent away from a sale).
4. **Same R0.** Quote `varrho` from the same R0 estimate as Section 4 and the
   tables at the time of reuse; re-read `tab-estimates.csv` rather than
   copying 0.16 from here.

### Related fact (kept in the paper, for reference)

Rates and flows point in opposite directions. For homes built by 1990 the
downgrade rate (15.2%) is about twice the upgrade rate (6.9%), but about 88%
of pairs start in D–G, so the flow is upward: about 89,900 pair-moves up
against 25,900 down per year of exposure, roughly 3.5 to 1. The two rates
imply a stationary A–C share of 0.069 / (0.069 + 0.152) = 31%, above the
current A–C share of older homes (12% of register pairs; 10–21% in the EHS).
These are register pairs, not the housing stock.

---

## 2. Reference-home magnitudes in Section 3.3

- **Removed:** 21 October 2026, when Section 3.3 was slimmed
  (`03-model.tex`, the paragraph after Figure `fig:thresholds`).
- **Reason:** the numbers use the estimated fixed cost of a renovation,
  $\xi_f = 0.1586$ (SE 0.169), so they are estimation results, not
  properties of the model. Section 3.3 now quotes only calibrated bounds:
  $C(h)/\Delta p \ge \xi/\gamma_p \approx 2.7$ for any home, and
  $\ell_b \le (\zeta_b+\zeta_s)\Delta p' \approx 0.09\,\Delta p'$.
  Candidate home: Section 5, once the estimates are final.

### Text as removed

```latex
For an owner in place, the part
not returned is large. For the reference home, a renovation costs about
\pounds26{,}600 and the premium is about \pounds7{,}000, so a sale in the
year after the work leaves $\ell\approx\pounds20{,}400$ unreturned. For a
buyer of the same home efficient, the part not returned is the transaction
costs on the premium, $\ell_b\approx\pounds620$, and mortality lowers the
threshold, because the heirs receive the premium the buyer paid.
[...]
For the reference home, buying
efficient is the cheaper route, and $C(h)-C_b+\Delta e\approx\pounds19{,}800$.
```

### Sources of the numbers

- Reference home: $p^N h = $ \pounds233,010 (4.668 model units of size), the
  home of the energy calibration; model unit \pounds49,914
  (`tab-fixed-parameters.csv`).
- $C(h) = \xi_f + \xi p^N h$ with $\xi = 0.08$ and the estimated $\xi_f$
  (`tab-estimates.csv`); $\Delta p = \gamma_p p^N h$ with $\gamma_p = 0.03$;
  $\Delta e = (e^N - e^R) h$ with $e^N = 0.0053$, $e^R = 0.0032$.
- With $\xi_f = 0$ the in-place loss would be $\ell \approx$ \pounds12,500
  instead of \pounds20,400.

### Checks before reusing

- Recompute from the final estimates; $\xi_f$ is imprecise (SE larger than
  the estimate).
- $\gamma_p$ and $\xi$ are still daggered in the fixed-parameter table:
  recover their sources first.

## 3. Horizon paragraph after eq:payoff-horizon in Section 3.3 (removed 2026-10-26)

Replaced after Ran Gu's comment. The text treated the loss of efficiency
as a level effect and ignored that moving falls with age. Both claims are
wrong: $\varrho$ enters as $\varrho^k$ and compresses the age differences,
and moving offsets mortality. Kept only for the record.

```latex
The loss of efficiency has a level effect and shortens the horizon at every age by the
same factor. Therefore, for $\varrho$ close to one, the horizon is
governed more by survival probability, and the stronger the age gradient can come from it.
```

Rough R0 check (not for the paper): with $\beta=0.97$, $\hat\varrho=0.84$,
ONS survival, and the simulated staying rate of all owners, the horizon is
3.1--4.1 years at every age (3.8 at 30, 4.1 at 65, 3.1 at 85); with
$\varrho=1$ it is 5.2--9.0 years.

## 4. "Window" passages in Sections 3.3 and 4 (replaced 2026-10-26)

Replaced after a coauthor comment: "window" meant three things (the
purchase as the cheaper moment, the gap between the two thresholds in
Proposition 3(c), and owners waiting in that gap). "Window" now means only
the purchase; the gap is "the gap"; owners in it are "owners who wait".

Proposition 3(c) label and opening:

```latex
\item \emph{The window.} The in-place threshold is greater than buyer's threshold and the gap widens
```

After Figure 3:

```latex
The window ties the payoff horizon to age. A short horizon has different
sources at different ages: young owners move often, and old owners are more
likely to die. Either source widens the window
(Proposition~\ref{prop:window}(c)). But the young buy often, and so leave
the window, while the old rarely buy, and stay in it. The horizon decides
who falls into the window, and purchases decide who gets out of it.

Because an owner in the window gets efficiency only when it next
buys, the frequency of purchases matters.
```

Section 4 (identification): "through the width of the window in
Proposition~\ref{prop:window}."

## 5. KMV source for omega_0 in Section 4 Preferences (removed 2026-10-26)

Removed at the user's request while the justification for $\omega_0=1.015$
is on hold. It followed "...and the size gradient $\omega_h$ is estimated."

```latex
The intercept
is from \citet[Table~1]{kaplan2020housing}. To capture additional utility
from owning, an owned home of size $h$ in their model gives $\omega h$
units of services and a rented home gives $h$, and they choose
$\omega=1.015$ to match the US homeownership rate of 66 percent in 1998.
They find the premium small: it is worth about half a percent of
consumption to the median owner. With $\omega_h=0$, our
equation~\eqref{eq:owner-services} for an inefficient home is their
specification, and an owned home gives 1.5 percent more services per unit
than a rented home whatever its size. The size term adds a premium that
rises with size.
```

Verified in KMV (JPE 2020), Table 1: "Additional utility from owning",
1.015, calibrated internally to the 1998 US homeownership rate of 66
percent; s = omega h for owners, s = h for renters; worth about half a
percentage point of consumption to the median homeowner.

Options discussed for defending $\omega_0=1.015$ without KMV:

1. Model units, no new computation: with Cobb--Douglas and $\alpha=0.75$,
   $\omega_0$ alone is worth $1.015^{1/3}-1\approx0.5$ percent of
   consumption.
2. Uses the R0 estimate ($\omega_h=0.129$, needs the user's confirmation):
   the total premium $\omega(h)-1$ is 13.7 percent at $h=3.14$ (intercept
   share about 11 percent) and 37.8 percent at $h=31.1$ (about 4 percent).
3. Robustness: re-estimate $\omega_h$ with $\omega_0=1$. This needs
   re-estimation and retraining, since $\omega_0$ is not a network input.
4. A larger referee risk: the total premium is worth
   $1.137^{1/3}-1\approx4.4$ percent of consumption at the smallest owned
   home and about 11 percent at the largest, an order of magnitude above
   KMV's 0.5 percent.

## 6. Symbol definitions after eq:payoff-horizon in Section 3.3 (replaced 2026-10-28)

Replaced by the user's fuller description (the k-th term, the k = 0 term,
the three factors), moved there from Section 5.1. Kept for the record; it
also defined $\mu_j$ for an owner *of an efficient home*, which the new text
leaves to "the owner".

```latex
where $\mu_j$ is the probability that an owner of an efficient home of age
$j$ does not move, {\draft $\varrho$} is the probability that an efficient home remains efficient, and $\phi_{\boldsymbol{(\cdot})}$ is the survival probability.
```

## 7. varrho = 0.96 paragraph after Table tab:mechanisms in Section 5.1 (moved 2026-10-29)

Moved up to follow the Table tab:payoff-horizon discussion and trimmed to the
horizon only, so that Table 7's varrho rows are discussed once. Dropped: the
shares at varrho = 0.96 (still in the opening paragraph of Appendix E), "the
horizon roughly doubles" (loose: 5.3 to 14.1 at 25 with decay alone, 3.4 to
6.2 with moving), and the 1.17 sentence, which repeated the previous paragraph.

```latex
Because $\varrho$ is imprecise and close to the lower end of its range
(Section~\ref{sec:estimates}), we also ask whether these conclusions hold
when efficiency lasts 25 years, at $\varrho=0.96$. The other parameters stay
at the estimates, so the efficient share is far above the data: 43.1, 45.9,
and 36.8 percent at 25--34, 35--64, and 65--75, against 21.0, 16.9, and 9.7
percent. At $\varrho=0.96$ the horizon roughly doubles, and survival starts
to matter: with loss of efficiency alone, the horizon falls from 14.1 years
at 25 to 7.8 at 75 (column~5 of Table~\ref{tab:payoff-horizon-varrho} in
Appendix~\ref{app:varrho}). Once moving is added it is again close to flat: 6.2
years at 25, 5.7 at 45, 6.1 at 65, and 5.4 at 75 with the model's
probabilities of moving (column~6), and 6.7, 9.8, 8.8, and 7.0 years with those in
Understanding Society (column~7). The gradient is at its flattest here: the share peaks at 35--64, and
the share at 25--34 is only 1.17 times the share at 65--75. A longer horizon
does not produce a steeper gradient. Section~\ref{sec:results-window}
returns to this case once it has set out the accounting.
```

## 8. Table 7 paragraph in Section 5.1 (replaced 2026-10-30)

Replaced when Table 7 (tab:mechanisms-payoff) became Figure
fig:mechanisms-payoff and moved to Appendix F. The old framing called both
experiments a test of the horizon ("a payoff that lasts longer should
steepen it"), but varrho also changes stock memory, and eta does not change
the horizon at all. The new text splits the two parameters and the two forces
of varrho.

```latex
A direct test asks whether a larger or longer-lasting payoff changes the
gradient. If the horizon drove the gradient, a payoff that lasts longer
should steepen it, since a long-lasting payoff is worth more to an owner who
expects to live long. Table~\ref{tab:mechanisms-payoff} changes one
ingredient at a time, keeps the other parameters at the estimates, and lets
households re-optimize. The comfort value $\eta$ sets the payoff per year.
Without comfort the efficient share falls at every age, to 17.2, 13.3, and
9.7 percent at 25--34, 35--64, and 65--75. With comfort doubled it rises at
every age, to 27.9, 23.1, and 16.6 percent. The ratio of the share at 25--34
to the share at 65--75 hardly moves: it is 1.76 and 1.68, against 1.75 at
the estimates. A larger payoff per year raises the level of the profile,
not its slope. Retention $\varrho$ sets how long the payoff lasts. Raising
$\varrho$ from its estimate of 0.84 to 0.88, 0.92, and 0.96 raises the share
at every age, proportionally more among older owners, and the ratio falls
from 1.78 to 1.68, 1.49, and 1.17. A longer-lasting payoff flattens the
gradient. The reason is the one behind Fact~3. A home that is efficient at
purchase is still efficient $k$ years later with probability $\varrho^k$, so
when $\varrho$ is low the share is low among owners who bought long ago, and
these are mostly older owners. When efficiency lasts, the stock remembers
old purchases, and older owners catch up.
```

## 9. Dose sentence in Section 6.1 (removed 2026-11-05)

Removed when the user decided not to add the dose-response figure
(`fig-policy-dose.pdf`, `fig_policy_dose.R`) to the paper; without the
figure the number has no exhibit. Numbers from `fig-policy-dose.csv`
(counterfactual solution, seed 1). It followed "...and narrows the gap by
0.6 points (column~(2))." in the fixed-cost paragraph.

```latex
For either cost, a larger cut has a more
than proportionally larger effect: cutting the variable cost by three
quarters raises the share among all owners by 13.6 points, more than twice
the effect of halving it (\open{online appendix figure of the dose
response, not yet placed}).
```

Update (2026-11-05): the user restored the sentence, without the figure
pointer, as a footnote at the end of the fixed-cost paragraph, with a red
supplement explaining the convexity (taste shocks; in-place rates from the
m7-dose-island-s1 cells).

## 10. Introduction paragraph 4, "Why a model, and the answer" (removed 2026-11-10)

Removed because its method and results repeat the model paragraph and
paragraphs 8-9 (Results 1-2). Its bridge and scope sentences moved to the
opening of the model paragraph. Not yet placed elsewhere: the confound
sentence ("Age also moves together with cohort ... sees least of the owners
who stay"), which could go in the estimation paragraph (7).

```latex
% 4. Why a model, and the answer
Which route sets the gradient depends on how fast efficiency wears off
relative to how fast mortality rises, and on how much cheaper efficiency is
at a purchase than through a renovation. Neither is observed directly. Age
also moves together with cohort and with the time since the last purchase,
and the certificate register observes a home mostly when it is sold or
let, so it sees least of the owners who stay. Other explanations could
also produce the facts: older owners may value efficiency less, know less
about it, find the work more burdensome, or prefer to run down their home
equity \addref{Davidoff (2004), ``Maintenance and the Home Equity of the
Elderly''}. We do not rule these out. We ask a different question: can the
economics of the investment alone (its cost, the price of efficient homes,
mortality, and the timing of moves) account for the gradient? We therefore
build a life-cycle model in which tastes, information, and the burden of
the work are the same at every age and both forces operate, estimate both
quantities on English data, and switch each force off in turn. The answer is the window.
In the estimated model, the fall in
purchases accounts for 99 percent of the fall in the inflow of owners into
efficient homes between ages 25--34 and 65--75
(Table~\ref{tab:flows-accounting}). The horizon is not what moves the
gradient, because it hardly varies with age. Counting survival alone, the
payoff horizon of an efficient home is 27 years at age 25 and 10 years at
75. Once efficiency wears off at the rate we estimate, it is 5.3 years at 25
and 4.4 at 75 (Table~\ref{tab:payoff-horizon}).
```

## 11. Introduction paragraphs 8-9, Results 1 and 2 (merged and simplified 2026-11-10)

Replaced by one paragraph in words with round numbers. Cut and not placed
elsewhere in the introduction: the horizon with moving added (3.4 and 2.9
years), the comfort-value sentence, the 103 percent figure for 35--64, and
the bequest-motive sentence with its open item (left to Section 5).

```latex
% 8. Result 1: the payoff horizon hardly varies with age
Our first result is that the payoff horizon hardly varies with age.
Counting survival alone, it is 26.9 years at age 25 and 10.0 at 75. Adding
the loss of efficiency, it is 5.3 and 4.4 years, and adding moving at the
model's rates, 3.4 and 2.9 years (Table~\ref{tab:payoff-horizon}).
Efficiency wears off long before most owners die, and an owner who moves
leaves it behind. Both cap the horizon at every age, so mortality shortens
it only near the end of life. How much efficiency is worth each year moves
the level of the age profile, not its slope: with no comfort value, or with
the comfort value doubled, the share at 25--34 stays about 1.7 times the
share at 65--75 (Figure~\ref{fig:mechanisms-payoff}). For an attribute that
wears off or is left behind at a move, the remaining lifetime is not what
limits the return.

% 9. Result 2: the window accounts for the gradient
Our second result is that the window accounts for the gradient. Purchases
account for 99 percent of the fall in the inflow into efficient homes from
25--34 to 65--75, and for 103 percent of the fall from 35--64
(Table~\ref{tab:flows-accounting}). At every age, between 40 and 46 percent
of purchases are of efficient homes, and between 1.4 and 1.7 percent of
owners of inefficient homes renovate in place each year. What falls with
age is how often owners buy. Closing the window removes the gradient: when
no efficient homes are for sale and households re-optimize, the gap between
the youngest and the oldest group falls from 9.6 to 1.3 points
(Table~\ref{tab:mechanisms-window}). Owners who stop buying do not
renovate in place instead, largely because of the fixed cost of a
renovation, which a buyer of an efficient home avoids. How often older
households buy depends on the bequest motive: with a weak one, households
aged 65--75 buy almost four times as often, and the gradient reverses.
\open{Keep the bequest sentence, or drop it here and leave the experiment
to Section~\ref{sec:results-window}.} The result survives a much slower
loss of efficiency. If efficiency lasts 25 years rather than six, the
horizon does fall with age, from 14.1 to 7.8 years with survival and the
loss of efficiency, but purchases still account for 90 and 89 percent of
the two falls.
```

## 12. Open item on sizing the ageing effect, introduction paragraph 11 (removed 2026-11-10)

Removed after the calculation was run and the effect turned out small. The
result is not in the paper.

```latex
\open{Optional:
size the ageing effect by reweighting the model's shares by age with ONS
projections of owners by age (no retraining). Not run.}
```

Calculation (one-off, no script in the replication folder yet). The model's
efficient share among owners and ownership rate by single year of age, from
`replication/output/figures/fig-lifecycle-fit.csv` (panel `abc`, series
`Model`; panel `own`, series `overall`), averaged within ten-year bands
(25-34 to 75-84, and 85). Weights: ONS 2022-based household projections for
England by age of the household reference person, Table 1 of the bulletin,
2022 and 2032, times the ownership rate of the band. Households under 25
dropped. The age profile is held fixed; only the age mix changes.

| | 2022 | 2032 |
|---|---|---|
| Owners aged 65+ as a share of owners (model ownership rates) | 38.1% | 41.9% |
| Efficient share among all owners | 16.06% | 15.90% |

The efficient share falls by 0.16 points (1.0 percent of its level), about
26,000 efficient homes out of 2.5 million. With EHS ownership rates (0.393
at 25-34, 0.665 at 35-64, 0.776 at 65+) the fall is also 0.16 points and
the 65+ share of owners goes from 35.8% to 39.3%. The effect is small
because the 65+ share of owners rises by about 4 points and the efficient
share differs by about 5 points between owners under and over 65.

## 13. Introduction paragraph 13, "What the paper does not do" (removed 2026-11-10)

Removed whole at the user's request, with its two open items. Text as it stood:

```latex
The analysis has limits. The model is partial equilibrium, so house prices
and the premium on efficient homes do not respond to policy; this matters
most for the point-of-sale standard, which raises the demand for efficient
homes the most. We compare steady states rather than transitions, and we do
not compute welfare or put a value on the emissions avoided. \open{Optional:
express the age gap in pounds of bills or tonnes of CO$_2$, arithmetic on
simulated bills and the conversion factors in \citet{govuk_ghg}; no
retraining. Not computed.} The model is stationary, so a cohort that bought
before certificates existed looks like any other, and the model explains
the age gradient with life-cycle forces alone. Renters do not choose
efficiency, and the model is estimated on English data. \open{Whether to say
that the model is not asked to match the years-since-purchase profile
(Fact~3); checking it on simulated panels would be an untargeted test of
the window. Not done.}
```

Arithmetic for the first open item (bills and CO2), run but not used. From
the calibration in Appendix A (reference home of 101.75 square meters):

| Step | Value |
|---|---|
| Bill in a D-G home vs an A-C home | 1,242 vs 735 pounds, so 507 pounds a year |
| Energy behind the gap | about 8,400 kWh a year (80% gas, 20% electricity) |
| Emissions behind the gap | about 1.6 tonnes CO2e a year per home |
| Age gap in the efficient share (25-34 vs 65-75) | 11 points |
| Gap per older owner household | about 56 pounds and 0.17 tonnes CO2e a year |
| Across about 5.8 million owner households aged 65+ in England | about 320 million pounds and 1 million tonnes CO2e a year |

Notes: gas factor 0.184 kg CO2e per kWh (2019 UK government conversion
factors); electricity factor 0.21-0.26, from memory, not confirmed. The bib
key `govuk_ghg` is the Green Homes Grant guidance, not conversion factors.
A version with the model's own home sizes by age would need a re-run of
`replication/code/3-model/simulate_lifecycle.py` (no retraining).
