/*
 * Jeferson S. Silva (eng.jefersonsantiago@gmail.com)
 *
 */

#ifndef SIMPLE_SWITCH_PSA_DIV_H_
#define SIMPLE_SWITCH_PSA_DIV_H_

#include <bm/bm_sim/extern.h>

namespace bm {

class DivByN : public bm::ExternType {
 public:
  BM_EXTERN_ATTRIBUTES {
    BM_EXTERN_ATTRIBUTE_ADD(verbose);
  }

  void init() override;

  void divide(const Data& num, const Data& den, Data& result);

 private:
  // Attribute
  Data verbose{};

  // Data members
  bool verbose_{false};
};

}  // namespace bm
#endif
