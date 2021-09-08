#include "div.h"
#include <bm/bm_sim/logger.h>

namespace bm {

void
DivByN::init() {
  // Attributes
  static constexpr std::uint32_t QUIET = 0u;

  // Init variables
  verbose_ = verbose.get<std::uint32_t>() != QUIET;
}

void
DivByN::divide(const Data& num, const Data& den, Data& res) {
  _BM_ASSERT((den.get<int64_t>() != 0) && "[Error] Denominator cannot be 0.");
  res = Data{num.get<std::int64_t>()/den.get<int64_t>()};
  if (verbose_){
    BMLOG_DEBUG("Invoked DivByN user extern: {}/{} = {}", 
		num.get<std::int64_t>(), den.get<std::int64_t>(),
		res.get<std::int64_t>())
  }
}

BM_REGISTER_EXTERN(DivByN)
BM_REGISTER_EXTERN_METHOD(DivByN, divide, const Data&, const Data&, Data&);


}  // namespace bm

int import_div(){
  return 0;
}
